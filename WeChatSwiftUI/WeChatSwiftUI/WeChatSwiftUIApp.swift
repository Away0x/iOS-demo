//
//  WeChatSwiftUIApp.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/20.
//

import SwiftUI

// 类似 UIKit 的 appDelegate
@main
struct WeChatSwiftUIApp: App {
    
    // propertyWrapper 属性包装器
    // 实例化 AppDelegate 管理生命周期
    // 等同 private var appDelegate = UIApplicationDelegateAdaptor(MyAppDelegate.self)
    @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    
    // @Environment(\.colorScheme) var colorScheme: ColorScheme // 得到当前用户设备是深色还是浅色模式
    
    // 窗口的阶段
    // ios 应用只有一个窗口, 所以可以看作是 app 的阶段
    // ipad/macos 应用有多个窗口
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            // 类似 UIKit 的 RootViewController
            Home()
        }
        // 监听 scenePhase 的变化
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                // 建议操作: 释放资源, 保存数据, 暂停计时器 ...
                print("app 进入后台了或关闭了")
            case .inactive:
                // 比如下拉手机显示控制中心时, app 被中断了
                // 进入后台前也会被触发
                // 建议操作: 暂停正在进行的任务, 暂停计时器 ...
                print("app 变成非活跃状态")
            case .active:
                // 建议操作: 刷新视图, 开启计时器 ...
                print("app 变成活跃状态")
            @unknown default:
                print("...")
            }
        }
    }
}

class MyAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        config()
        
        return true
    }
    
    private func config() {
        // 默认在 tabbar/navbar 和 content 有重叠时是毛玻璃效果, 无重叠时是纯色背景
        // 我们可以通过 UIKit 修改这个行为 (swiftui 目前不支持这个修改)
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground() // 毛玻璃效果
        // 让整个项目中的 navBar 都应用这个效果
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        // 修改 tabbar item 的样式
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.selected.iconColor = UIColor(named: "WeChatGreen")
        tabBarItemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "WeChatGreen")!,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .medium)
        ]
        
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
