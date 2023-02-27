//
//  BillAppSwiftUI_CoreDataApp.swift
//  BillAppSwiftUI-CoreData
//
//  Created by 吴彤 on 2023/2/26.
//

import SwiftUI

@main
struct BillAppSwiftUI_CoreDataApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var bill = Bill()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bill)
                .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase {
                    case .background:
                        print("App进入后台了")
                        // app 进入后台时, 如果数据有变动则自动保存
                        persistenceController.saveViewContextIfChanged()
                    case .inactive:
                        print("App变成非活跃状态")
                    case .active:
                        print("App变成活跃状态")
                    @unknown default:
                        print("其余在未来系统追加的生命周期")
                    }
                }
        }
    }
}
