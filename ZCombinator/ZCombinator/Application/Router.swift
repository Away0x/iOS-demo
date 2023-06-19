//
//  Router.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/14.
//

import SwiftUI
import HackerNewsKit

public enum AWDestination: Hashable {
    case pin
    case fav
    case search
    case submission([Int])
    case profile(String)
    case url(URL)
    case replyComment(Comment)
    case replyStory(Story)

    @ViewBuilder
    func toView() -> some View {
        switch self {
        case .pin:
            Placeholder(text: "pin")
        case .fav:
            Placeholder(text: "fav")
        case .search:
            Placeholder(text: "search")
        case .submission(_):
            Placeholder(text: "submission")
        case .profile(_):
            Placeholder(text: "profile")
        case .url(_):
            Placeholder(text: "url")
        case .replyComment(_):
            Placeholder(text: "replyComment")
        case .replyStory(_):
            Placeholder(text: "replyStory")
        }
    }
}

struct Placeholder: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
}

class AWRouter: ObservableObject {
    @Published var path: NavigationPath = .init()
    
    static let shared: AWRouter = .init()
    
    private init() {}
    
    func to(_ destination: AWDestination) {
        path.append(destination)
    }
}
