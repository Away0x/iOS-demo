//
//  AnimationSpring.swift
//  AnimationSwiftUI
//
//  Created by 吴彤 on 2022/11/29.
//

import SwiftUI

struct AnimationSpring: View {
    @State private var moveDistance: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 50))
                    .offset(x: moveDistance, y: 0)
                    .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0.2), value: moveDistance)
                Spacer()
            }
            Button("点击移动爱心") {
                moveDistance += 80
            }.font(.title)
        }
    }
}

struct AnimationSpring_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSpring()
    }
}
