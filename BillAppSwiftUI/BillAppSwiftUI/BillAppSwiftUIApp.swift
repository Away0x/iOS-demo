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
            ContentView().environmentObject(auth).onAppear {
                auth.login(user: UserItem(name: "TongWU"))
            }
        }
    }
}
