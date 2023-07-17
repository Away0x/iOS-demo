//
//  AppMain.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/5.
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
                .environmentObject(CatAPIManager.shared)
        }
    }
}

extension AppMain {
    func applyTabBarBackground() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor  = .systemBackground.withAlphaComponent(0.3)
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .systemChromeMaterial)
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
