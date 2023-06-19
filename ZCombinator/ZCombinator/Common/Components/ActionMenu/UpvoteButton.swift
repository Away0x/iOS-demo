//
//  UpvoteButton.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/15.
//

import SwiftUI

struct UpvoteButton: View {
    @EnvironmentObject var auth: AuthenticationStore
    
    let id: Int
    let actionPerformed: Binding<ActionEnum>
    
    var body: some View {
        Button {
            onUpvote()
        } label: {
            Label("Upvote", systemImage: "hand.thumbsup")
        }
        .disabled(!auth.loggedIn)
    }
    
    private func onUpvote() {
        Task {
            let res = await auth.upvote(id)
            
            if res {
                actionPerformed.wrappedValue = .upvote
//                HapticFeedbackService.shared.success()
            } else {
//                HapticFeedbackService.shared.error()
            }
        }
    }
}

struct UpvoteButton_Previews: PreviewProvider {
    @State static var actionPerformed: ActionEnum = ActionEnum.none
    
    static var previews: some View {
        UpvoteButton(id: 1, actionPerformed: $actionPerformed)
            .environmentObject(AuthenticationStore.shared)
    }
}
