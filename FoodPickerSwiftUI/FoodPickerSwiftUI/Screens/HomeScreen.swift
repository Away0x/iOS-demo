//
//  HomeScreen.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/30.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage(.shouldUseDarkMode) var shouldUseDarkMode = false
    @State var tab: Tab = .picker
//    @State var tab: Tab = {
//        let rawValue = UserDefaults.standard.string(forKey: UserDefaults.Key.startTab.rawValue) ?? ""
//        return Tab(rawValue: rawValue) ?? .picker
//        // 下面的方式也行
//        // @AppStorage(.startTab) var tab = HomeScreen.Tab.picker
//        // return tab
//        // 或者也可让父组件来传入, 详见下面的 preview
//    }()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $tab) {
                // foreach 会自动给 Tab 加上 tag 和 id, value 为 id
                ForEach(Tab.allCases, id: \.self) { $0 }
            }
            // sheet 弹窗和 homeScreen 其实不是在一个结构里面的
            // 所以这里 environment 修改不了 sheet 的 theme
            // 可以用 preferredColorScheme 来修改 (他可以把数据往上进行传递)
            // - 只会传递到上面最近的一个 presentation 的地方
            //.environment(\.colorScheme, shouldUseDarkMode ? .dark : .light)
            .preferredColorScheme(shouldUseDarkMode ? .dark : .light)
        }
    }
}

extension HomeScreen {
    enum Tab: String, View, CaseIterable {
        case picker, list, settings
        
        var body: some View {
            content.tabItem { tabLabel.labelStyle(.iconOnly) }
        }
        
        @ViewBuilder
        private var content: some View {
            switch self {
                case .picker: FoodPickerScreen()
                case .list: FoodListScreen()
                case .settings: SettingsScreen()
            }
        }
        
        private var tabLabel: some View {
            switch self {
                case .picker:
                    return Label("Home", systemImage: .house)
                case .list:
                    return Label("List", systemImage: .list)
                case .settings:
                    return Label("Settings", systemImage: .gear)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider, View {
    @AppStorage(.startTab) var tab = HomeScreen.Tab.settings
    
    var body: some View {
        HomeScreen(tab: tab)
    }
    
    static var previews: some View {
        Self()
    }
}
