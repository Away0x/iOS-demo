//
//  Message.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/21.
//

import Foundation

struct Message: Identifiable {
    let id: Int
    let imageName: String
    let nickName: String
    let messageText: String
    let messageDate: String
}
