//
//  CatAPIManager.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/13.
//

import Foundation

// 要观察 reference type 的变化可以使用 ObservableObject
@MainActor
final class CatAPIManager: ObservableObject {
    @Published private(set) var favorites: [FavoriteItem] = []
    
//    private(set) var favorites: [FavoriteItem] = [] {
//        willSet {
//            Task {
//                objectWillChange.send()
//            }
//        }
//    }
    
    var getData: (Endpoint) async throws -> Data
    
    private let startDate = Date.now
    
    init(getData: @escaping (Endpoint) async throws -> Data) {
        self.getData = getData
    }
}

// MARK: singleton
extension CatAPIManager {
    static let shared = {
        let config = URLSessionConfiguration.default
        var headers = config.httpAdditionalHeaders ?? [:]
        headers["x-api-key"] = MySecret.apiKey
        config.httpAdditionalHeaders = headers
        
        let session = URLSession(configuration: config)
        return CatAPIManager { try await session.data(for: $0.request) }
    }()
    
    static let preview = CatAPIManager {
        try? await Task.sleep(for: .seconds(1))
        return $0.stub
    }
}

// MARK: interface
extension CatAPIManager {
    func getImages() async throws -> [ImageResponse] {
        try await fetch(endpoint: .images)
    }
    
    func getFavorites(page: Int, limit: Int = 100) async -> FavoriteLoadingState {
        do {
            var items: [FavoriteItem] = try await fetch(endpoint: .favorites(page: page, limit: limit))
            // 避免重复添加, 每次执行时, 清理掉旧数据
            while let lastItem = items.last, lastItem.createdAt > startDate {
                items.removeLast()
            }
            
            favorites += items
            let isLastPage = items.count < limit
            return .success(nextPage: isLastPage ? nil : page + 1)
        } catch {
            return .fail(retryPage: page)
        }
    }
    
    func toggleFavorite(_ cat: CatImageViewModel) async throws {
        guard let index = favorites.firstIndex(where: \.imageID == cat.id)  else {
            try await addToFavorite(cat: cat)
            return
        }
        try await removeFromFavorite(at: index)
    }
    
    
    func addToFavorite(cat: CatImageViewModel) async throws {
        let body = ["image_id": cat.id]
        let bodyData = try JSONSerialization.data(withJSONObject: body)
        let response: FavoriteCreationResponse = try await fetch(endpoint: .addToFavorite(bodyData: bodyData))
        
        favorites.append(.init(catImage: cat, id: response.id))
    }
    
    func removeFromFavorite(id: Int) async throws {
        do {
            guard let index = favorites.firstIndex(where: \.id == id) else { return }
            try await removeFromFavorite(at: index)
        } catch URLSession.APIError.invalidCode(400) {
            // 不存在的最愛 ID，默默略過這個錯誤
        }
    }
}

// MARK: helper
private extension CatAPIManager {
    // 这个方法不需要在 MainActor 上执行, 所以为 nonisolated
    nonisolated func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        
        let data = try await getData(endpoint)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFromatter)
        
        return try decoder.decode(T.self, from: data)
    }
    
    func removeFromFavorite(at index: Int) async throws {
        do {
            let _ = try await getData(.removeFromFavorite(id: favorites[index].id))
            favorites.remove(at: index)
        } catch URLSession.APIError.invalidCode(400) {
            // 不存在的最愛 ID，默默略過這個錯誤
        }
    }
}
