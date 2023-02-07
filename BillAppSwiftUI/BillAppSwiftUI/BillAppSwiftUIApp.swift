//
//  BillAppSwiftUIApp.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import SwiftUI

@main
struct BillAppSwiftUIApp: App {
    @StateObject
    var auth = Auth()
    
    var body: some Scene {
        WindowGroup {
            // 子组件可通过
            // @EnvironmentObject var auth: Auth 获取到 (相当于注入了个全局 state)
            // 这种方式是通过对象类型找到的, 所以如果要传递多个对象, 最好定义不同的类型
            ContentView().environmentObject(auth).onAppear {
                auth.login(user: UserItem(name: "TongWU"))
            }
        }
    }
}
