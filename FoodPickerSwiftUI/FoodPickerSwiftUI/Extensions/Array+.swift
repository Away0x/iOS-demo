//
//  Array+.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/7/1.
//

import Foundation

// 比如 [Food], 由于 Food 是 Codable, 所以由于这个 extension, [Food] 可以直接被序列化
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
//              let array = try? JSONDecoder().decode([Food].self, from: data)
              let array = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        self = array
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let string = String(data: data, encoding: .utf8) else {
            return ""
        }
        return string
    }
}
