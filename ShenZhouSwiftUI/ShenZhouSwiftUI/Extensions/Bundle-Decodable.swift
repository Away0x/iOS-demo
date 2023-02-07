//
//  Bundle-Decodable.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import Foundation

extension Bundle {
    // 加载并解析 json 文件
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("没有在项目里面找到\(file)文件")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("加载\(file)文件失败")
        }
        
        let decoder = JSONDecoder()
        guard let datas = try? decoder.decode([T].self, from: data) else {
            fatalError("\(file)文件JSON解码失败")
        }
        
        return datas
    }
}
