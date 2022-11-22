//
//  MessageDetail.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI

struct MessageDetail: View {
    
    let message: Message
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle(message.nickName)
    }
}

struct MessageDetail_Previews: PreviewProvider {
    static var previews: some View {
        MessageDetail(message: Message(
            id: 1,
            imageName: "JackMa",
            nickName: "马云",
            messageText: "花呗还了吗",
            messageDate: "上午 6:00")
        )
    }
}
