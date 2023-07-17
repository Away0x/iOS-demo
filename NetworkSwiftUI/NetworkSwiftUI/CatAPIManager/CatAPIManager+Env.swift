//
//  CatAPIManager+Env.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/13.
//

import SwiftUI

struct CatAPIManagerKey: EnvironmentKey {
    static var defaultValue: CatAPIManager = .shared
}

extension EnvironmentValues {
    var apiManager: CatAPIManager {
        get { self[CatAPIManagerKey.self] }
        set { self[CatAPIManagerKey.self] = newValue }
    }
}
