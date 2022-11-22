//
//  MessageRow.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/21.
//

import SwiftUI

struct MessageRow: View {
    
    let message: Message
    
    var body: some View {
        HStack(spacing: 10) {
            Image(message.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(message.nickName)
                        .font(.system(size: 17))
                    Text(message.messageText)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(message.messageDate)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }.padding([.top, .bottom], 8)
    }
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(message: Message(
            id: 1,
            imageName: "JackMa",
            nickName: "马云",
            messageText: "花呗还了吗",
            messageDate: "上午 6:00")
        )
    }
}
