//
//  AnimationRepeat.swift
//  AnimationSwiftUI
//
//  Created by 吴彤 on 2022/12/3.
//

import SwiftUI

struct AnimationRepeat: View {
    @State private var amount = 1.0
    
    var body: some View {
        Button("抢红包") { }
        .foregroundColor(.white)
        .padding(50)
        .background(.red)
        .clipShape(Circle())
        .overlay {
            // overlay 类似 zstack, 但是更简单, overlay 里面的视图作为子视图存在, 且层级比父视图高
            // 覆盖一个边框视图, 来做动画
            Circle()
                .stroke(.red)
                .scaleEffect(amount)
                .opacity(2 - amount)
                .animation(
                    .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: amount
                )
        }
        .onAppear {
            amount = 2
        }
    }
}

struct AnimationRepeat_Previews: PreviewProvider {
    static var previews: some View {
        AnimationRepeat()
    }
}
