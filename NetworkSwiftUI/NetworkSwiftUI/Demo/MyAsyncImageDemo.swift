//
//  MyAsyncImageDemo.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/5.
//

import SwiftUI


struct MyAsyncImage: View {
    @State private var phase: AsyncImagePhase
    let urlRequest: URLRequest
    var session: URLSession = .imageSession
    
    init(url: URL, session: URLSession = .imageSession) {
        self.session = session
        self.urlRequest = URLRequest(url: url)
        
        // 启动时判断是否已有 cache, 并且设置 phase
        if let data = session.configuration.urlCache?.cachedResponse(for: urlRequest)?.data,
           let uiImage = UIImage(data: data) {
            _phase = .init(wrappedValue: .success(.init(uiImage: uiImage)))
        } else {
            _phase = .init(wrappedValue: .empty)
        }
    }
    
    var body: some View {
        Group {
            switch phase {
                case .empty:
                    ProgressView().scaleEffect(3)
                        .task { await load() }
                case .success(let image):
                    image.resizable().scaledToFit()
                case .failure:
                    Text("圖片無法顯示")
                @unknown default:
                    fatalError("This has not been implemented.")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func load() async {
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode,
                  let uiImage = UIImage(data: data)
            else {
                throw URLError(.unknown)
            }
            
            phase = .success(.init(uiImage: uiImage))
        } catch {
            phase = .failure(error)
        }
    }
}


struct MyAsyncImageDemo: View {
    @State private var id: UUID = UUID()
    // 如果图片大于 disk 大小的 5%, 则 cache 机制不会生效
//    let url = URL(string: "https://images.unsplash.com/photo-1678880032033-d954b408963c")!
    let url = URL(string: "https://images.unsplash.com/photo-1678880032033-d954b408963c?w=500")!
    
    var body: some View {
        VStack {
            titleView
            MyAsyncImage(url: url).id(id)
                .frame(height: 300)
            
            Button("重新整理") {
                id = UUID()
            }

        }
    }
}

extension MyAsyncImageDemo {
    var titleView: some View {
        Text("AsyncImage Demo")
            .font(.largeTitle.bold())
    }
}


struct AsyncImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        MyAsyncImageDemo()
    }
}
