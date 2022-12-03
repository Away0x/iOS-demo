//
//  Transitions.swift
//  AnimationSwiftUI
//
//  Created by 吴彤 on 2022/12/3.
//

import SwiftUI

struct Transitions: View {
    @State private var show = false
    private var padding = EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30)
    
    var body: some View {
        VStack {
            // 注意 button 的 padding 是不会触发事件的
            // 因为修饰符并不会改变 ui 控件本身, 而是额外的视图
            // 如果想要 padding 区域也能点击, 需要加在 button 的 label 中 (和 UIKit 不同)
//            Button { show.toggle() } label: {
//                // 这里面都属于 button 的内容, 所以都会触发 action
//                Text(show ? "隐藏图片" : "展示图片").padding(padding)
//            }
            Button(show ? "隐藏图片" : "展示图片") {
                withAnimation(.default) {
                    show.toggle()
                }
            }
            .foregroundColor(.white)
            .padding(padding)
            .background(.pink)
            .cornerRadius(8)
            
            Spacer()
            
            // 给一个 ui 控件加隐式动画, 必须其已经存在于页面上才行
            // 这种方式不会有动画 (除非改成显示动画)
//            if show {
//                Image(systemName: "sun.max.fill")
//                    .font(.system(size: 250))
//                    .foregroundColor(.yellow)
//                    .animation(.default, value: show)
//            }
            
            // 这种方式才能有动画
            VStack {
                if show {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 250))
                        .foregroundColor(.yellow)
                        // 合并动画
//                        .transition(.slide.combined(with: .opacity))
                        .transition(
                            // 指定出现和隐藏时的动画
                            .asymmetric(insertion: .slide.combined(with: .opacity), removal: .move(edge: .bottom))
                        )
                }
                Spacer()
            }
//            .animation(.linear(duration: 2), value: show)
        }
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        // 当前版本 canvas 有点 bug, 动画出现时不会播放, 隐藏时才会播放, 真机不会有问题
        // 可以在 preview 这里套一层 vstack 来解决
        VStack {
            Transitions()
        }
    }
}
