//
//  CatAPIManager+Response.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/13.
//

import Foundation

extension CatAPIManager {
    struct ImageResponse: Decodable {
        let id: String
        let url: URL
        let width, height: CGFloat
    }
    
    
    struct FavoriteCreationResponse: Decodable {
        let id: Int
    }
}
