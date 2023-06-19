//
//  ZCombinatorApp.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/13.
//

import SwiftUI

@main
struct ZCombinatorApp: App {
    let persistenceController = PersistenceController.shared
    
    let authStore: AuthenticationStore = .shared
    let settingsStore: SettingsStore = .shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(authStore)
                .environmentObject(settingsStore)
        }
    }
}
