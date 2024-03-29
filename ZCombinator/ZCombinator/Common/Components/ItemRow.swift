//
//  ItemRow.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/15.
//

import SwiftUI
import HackerNewsKit

struct ItemRow: View {
    @EnvironmentObject private var settingsStore: SettingsStore
    
    let item: any Item
    let url: URL?
    let isPinnedStory: Bool
    
    @State private var showSafari: Bool = .init()
    @State private var showHNSheet: Bool = .init()
    @State private var showReplySheet: Bool = .init()
    @State private var showFlagDialog: Bool = .init()
    @GestureState private var isDetectingPress: Bool = .init()
    @Binding private var actionPerformed: ActionEnum
    
    init(item: any Item, isPinnedStory: Bool = false, actionPerformed: Binding<ActionEnum>) {
        self.item = item
        self.url = URL(string: item.url ?? "https://news.ycombinator.com/item?id=\(item.id)")
        self.isPinnedStory = isPinnedStory
        self._actionPerformed = actionPerformed
    }
    
    var body: some View {
        ZStack {
            Button {
                if item.isJobWithUrl {
                    showSafari = true
                }
            } label: {
                HStack {
                    VStack {
                        if item is Story {
                            Text(item.title.orEmpty)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding([.horizontal, .top])
                            Spacer()
                        }
                        HStack {
                            if let url = item.readableUrl {
                                Text(url)
                                    .font(.footnote)
                                    .foregroundColor(.orange)
                            } else if let text = item.text {
                                Text(text)
                                    .font(.footnote)
                                    .lineLimit(2)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }.padding(item is Comment ? [.horizontal, .top] : [.horizontal])
                        Divider().frame(maxWidth: .infinity)
                        HStack(alignment: .center) {
                            Text(item.metadata.orEmpty)
                                .font(.caption)
                                .padding(.top, 6)
                                .padding(.leading)
                                .padding(.bottom, 12)
                            Spacer()
                            if isPinnedStory {
                                Button {
//                                    onPin()
                                    print(123)
                                } label: {
                                    Label(String(), systemImage: "pin.fill")
                                        .rotationEffect(Angle(degrees: 45))
                                        .transformEffect(.init(translationX: 0, y: 5))
                                }
                            } else {
                                menu
                            }
                        }
                    }
                }
            }

        }
    }
    
    @ViewBuilder
    var menu: some View {
        Menu {
            UpvoteButton(id: item.id, actionPerformed: $actionPerformed)
//            DownvoteButton(id: item.id, actionPerformed: $actionPerformed)
//            FavButton(id: item.id, actionPerformed: $actionPerformed)
//            PinButton(id: item.id, actionPerformed: $actionPerformed)
//            Divider()
//            FlagButton(id: item.id, showFlagDialog: $showFlagDialog)
//            Divider()
//            ShareMenu(item: item)
            Button {
                showHNSheet = true
            } label: {
                Label("View on Hacker News", systemImage: "safari")
            }
        } label: {
            Label("", systemImage: "ellipsis")
                .padding(.leading)
                .padding(.bottom, 12)
                .foregroundColor(.orange)
        }
    }
    
    private func onPin() {
//        settings.onPinToggle(item.id)
//        HapticFeedbackService.shared.light()
    }

    private func onFlagTap() {
        Task {
            let res = await AuthRepository.shared.flag(item.id)

            if res {
                actionPerformed = .flag
//                HapticFeedbackService.shared.success()
            } else {
//                HapticFeedbackService.shared.error()
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    @State static var actionPerformed: ActionEnum = ActionEnum.none
    
    static var previews: some View {
        let json = """
        {
            "id": 1,
            "time": 1,
            "text": "xxx"
        }
        """.data(using: .utf8)
        let data = json!
        let comment = try! JSONDecoder().decode(Comment.self, from: data)
        
        ItemRow(item: comment, actionPerformed: $actionPerformed)
    }
}
