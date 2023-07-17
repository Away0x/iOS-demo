//
//  URLCache+.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/10.
//

import Foundation

extension URLCache {
    static let imageCache: URLCache = {
        URLCache(memoryCapacity: 20 * 1024 * 1024,
                 diskCapacity: 30 * 1024 * 1024,
                 directory: FileManager.default.temporaryDirectory)
    }()
}
