//
//  StateBindingSwiftUIApp.swift
//  StateBindingSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI

@main
struct StateBindingSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TextFieldView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 所有 scroll view 拖动时会隐藏软键盘 (很奇怪, 例子中没有生效, 单独在 scroll view 上设置 scrollDismissesKeyboard 才生效)
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        
        return true
    }
}

