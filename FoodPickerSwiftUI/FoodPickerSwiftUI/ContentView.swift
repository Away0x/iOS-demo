//
//  ContentView.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/19.
//

import SwiftUI

// swiftui 的动画会进行结构和 id 的比对, 然后选择渲染动画
// 如果想让每次动画的判断都是全新的可以对 view 加上 id (.id(xxx)) 有点类似 react 的 key

struct ContentView: View {
    private let foods = ["汉堡", "沙拉", "披萨", "义大利麵", "鸡腿便当", "刀削麵", "火锅", "牛肉麵", "关东煮"]
    @State private var selectedFood: String?
    
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Text("今天吃什么?")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .id(selectedFood) // 每次都是不同的 id 框架会判断为不同的 view
                    // .transition(.scale.combined(with: .slide))
            }
            
            Group {
                Button {
                    selectedFood = foods.shuffled().first { $0 != selectedFood }
                } label: {
                    Text(selectedFood == .none ? "告诉我!" : "换一个")
                        .frame(width: 200)
                        // 告诉 swiftui 这个 text 如何做动画, 否则默认会淡入淡出
                        // identity 表示不做任何改变淡入淡出
                        .transformEffect(.identity)
                        // 关闭动画
                        // .animation(.none, value: selectedFood)
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, -15)
                
                Button {
                    selectedFood = .none
                } label: {
                    Text("重置")
                        .frame(width: 200)
                }
                .buttonStyle(.bordered)
            }
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .animation(.easeOut(duration: 1), value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
