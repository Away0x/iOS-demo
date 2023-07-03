//
//  AppMain.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/19.
//

import SwiftUI

@main
struct AppMain: App {
    
    init() {
        applyTabBarBackground()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}

extension AppMain {
    // 修改 tabbar 的 background
    // swiftui 目前的方式不太稳定, 所以使用 uikit 来修改
    func applyTabBarBackground() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor  = .secondarySystemBackground.withAlphaComponent(0.3)
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .systemChromeMaterial)
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
