//
//  URL+.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/10.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self.init(string: value.description)!
    }
}
