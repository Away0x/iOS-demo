//
//  Home.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            MessageList()
            
            Text("通讯录页面")
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("通讯录")
                }
            
            Text("发现页面")
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("发现")
                }
            
            Text("我的页面")
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
        }.onAppear {
            print("appear")
        }.onDisappear {
            print("disappear")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
