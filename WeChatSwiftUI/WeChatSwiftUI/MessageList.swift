//
//  MessageList.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/20.
//

import SwiftUI

struct MessageList: View {
    
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
        // NavigationView 本身只是个容器, 不渲染页面, 由他里面的页面进行 UI 展示
        // NavigationView 上面的 bar 叫做 NavigationBar, 里面每个子视图上面的 bar 叫做 NavigationItem (新版 swiftui 叫做 toolbar)
        // 所以要调整 NavigationItem 里面的东西需要给里面的视图加修饰符
        NavigationView {
            List(messages) { message in
                // NavigationLink 会使 row 右侧多一个 > 按钮
                // 我们可以使用 ZStack 来让 row 盖住他
//                NavigationLink {
//                    MessageDetail(message: message)
//                } label: {
//                    MessageRow(message: message)
//                }
                ZStack {
                    NavigationLink {
                        MessageDetail(message: message)
                    } label: {
                        EmptyView()
                    }.opacity(0) // 隐藏 link
                    MessageRow(message: message)
                }
            }
            .listStyle(.plain)
            // 操作 nav bar 都是在子视图中做
            .navigationTitle("微信")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // 可使用 ToolbarItem 设置布局位置
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Text("xxx")
//                }
                
                // 左右如果要放多个视图时, 可以用这个
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    Text("1")
//                    Text("2")
//                }
                
                // 默认在右边
                Button {
                    print("click button")
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.primary)
                }.padding(.horizontal)
            }
        }
        // 默认在宽屏会分栏
        .navigationViewStyle(.stack)
        .tabItem {
            Image(systemName: "message.fill")
            Text("微信")
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
