//
//  favorite.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/13.
//

import Foundation

enum FavoriteLoadingState: Equatable {
    case loading(page: Int)
    case success(nextPage: Int?)
    case fail(retryPage: Int)
}
