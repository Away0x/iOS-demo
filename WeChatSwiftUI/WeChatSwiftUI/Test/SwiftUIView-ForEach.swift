//
//  SwiftUIView-ForEach.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/21.
//

import SwiftUI

struct SwiftUIView_ForEach: View {
    var messages: [Message] = {
        var ms: [Message] = []
        for i in 1...20 {
            ms.append(Message(
                id: i,
                imageName: "JackMa",
                nickName: "马云\(i)",
                messageText: "花呗还了吗\(i)",
                messageDate: "上午 6:00")
            )
        }
        return ms
    }()
    
    var body: some View {
        VStack {
            ForEach(messages) { msg in
                HStack(spacing: 10) {
                    Image(msg.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(msg.nickName)
                                .font(.system(size: 17))
                            Text(msg.messageText)
                                .font(.system(size: 15))
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(msg.messageDate)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        }
}

struct SwiftUIView_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_ForEach()
    }
}
