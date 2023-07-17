//
//  Operator+.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/10.
//

import Foundation

func ==<T, Value: Equatable>(keyPath: KeyPath<T, Value>, value: Value) -> (T) -> Bool {
    { $0[keyPath: keyPath] == value }
}
