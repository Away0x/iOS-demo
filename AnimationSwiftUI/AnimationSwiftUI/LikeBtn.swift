//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by 吴彤 on 2022/11/29.
//

import SwiftUI

// 隐式动画 .animation 只能监听一个值引起的变化
// 显示动画 可以支持更复杂的场景

struct LikeBtn: View {
    @State private var isLike = false
    
    var body: some View {
        Image(systemName: isLike ? "heart.fill" : "heart")
            .font(.system(size: 100))
            .foregroundColor(isLike ? .red : .black)
            .scaleEffect(isLike ? 1.5 : 1)
            // 因为 isLike 导致视图变化, 整个过程都会加上动画 (隐式动画)
             .animation(.spring(
                response: 0.2,
                dampingFraction: 0.2
             ), value: isLike)
        
            // 给非 control 控件加事件
            .onTapGesture {
                isLike.toggle()
                
                // 显示动画
                // withAnimation {
                    // isLike.toggle()
                // }
            }
    }
}

struct LikeBtn_Previews: PreviewProvider {
    static var previews: some View {
        LikeBtn()
    }
}
