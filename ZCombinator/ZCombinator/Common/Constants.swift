//
//  Constants.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/14.
//

import Foundation

struct Constants {
    static let githubUrl = URL(string: "https://github.com/Livinglist/ZCombinator")!
    static let server = "news.ycombinator.com"
    static let happyFace = [
        "(๑•̀ㅂ•́)و✧",
        "( ͡• ͜ʖ ͡•)",
        "( ͡~ ͜ʖ ͡°)",
        "٩(˘◡˘)۶",
        "(─‿‿─)",
        "(¬‿¬)",
    ].randomElement().orEmpty
    
    struct UserDefaults {
        static let favListKey = "favList"
        static let pinListKey = "pinList"
    }
    
    struct AppNotification {
        static let lastItemPushedKey = "lastItemPushed"
        static let lastFetchedAtKey = "lastFetchedAt"
        static let backgroundTaskId = "fetchReplies"
    }
}
