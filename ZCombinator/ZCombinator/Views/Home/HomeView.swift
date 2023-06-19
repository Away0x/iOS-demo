//
//  HomeView.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/13.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var router: AWRouter = .shared
    @StateObject private var viewModel: HomeViewModel = .init()
    
    @State private var showLoginDialog: Bool = .init()
    @State private var showLogoutDialog: Bool = .init()
    @State private var showAboutSheet: Bool = .init()
    @State private var showUrlSheet: Bool = .init()
    
    @State private var username: String = .init()
    @State private var password: String = .init()

    @State private var actionPerformed: ActionEnum = .none
    @State private var columnVisibility: NavigationSplitViewVisibility = .doubleColumn
    
    private static var handledUrl: URL? = nil
    
    var body: some View {
        if DeviceTool.isPhone() {
            mainView
        } else {
            NavigationSplitView(columnVisibility: $columnVisibility) {
                mainView
            } detail: {
                NavigationStack(path: $router.path) {
                    Text("Tap on a story to its comments")
                        .navigationDestination(for: AWDestination.self) { val in
                            val.toView()
                        }
                }
            }
            .navigationSplitViewStyle(.balanced)
            .tint(.orange)
        }
    }
    
    @ViewBuilder
    var mainView: some View {
        storyList
            .if(DeviceTool.isPhone()) { view in
                view
            }
    }
    
    @ViewBuilder
    var storyList: some View {
        List {
            Button {
                router.to(.pin)
            } label: {
                Label("Pins", systemImage: "pin")
            }
            .listRowSeparator(.hidden)
            
            ForEach(viewModel.stories) { story in
                ItemRow(item: story,
                        actionPerformed: $actionPerformed)
                .listRowInsets(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                .listRowSeparator(.hidden)
                .onAppear {
                    viewModel.onStoryRowAppear(story)
                }
            }
        }
    }
}

extension HomeView {
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
