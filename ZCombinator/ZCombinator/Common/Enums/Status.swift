//
//  Status.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/15.
//

import Foundation

public enum StatusEnum {
    case idle
    // Loading with visible loading indicator.
    case loading
    // Loading with no loading indicator.
    case backgroundLoading
    case loaded
    case error
    
    var isLoading: Bool {
        switch self {
        case .loading, .backgroundLoading: return true
        default: return false
        }
    }
}
