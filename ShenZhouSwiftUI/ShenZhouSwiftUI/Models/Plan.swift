//
//  Plan.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import Foundation

// Codable 允许解析
// Identifiable 能够循环
struct Plan: Codable, Identifiable {
    let id: Int
    let name: String
    let launchDate: String
    let description: String
    let hasBadge: Bool
    
    let members: [Member]?
    
    struct Member: Codable {
        let name: String
        let birth: String
    }
    
    var imageName: String { hasBadge ? "shenzhou\(id)" : "placeholder"}
}
