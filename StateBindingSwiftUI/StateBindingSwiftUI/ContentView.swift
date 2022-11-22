//
//  ContentView.swift
//  StateBindingSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    
//    var body: some View {
//        Button {
//            isPlaying.toggle()
//        } label: {
//            Text(isPlaying ? "播放中" : "准备中")
//        }
//    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                Rectangle().frame(height: 300)
                // 加 $ 传递 binding 类型
                PlayerButton(isPlaying: $isPlaying)
            }
            Text(isPlaying ? "播放中" : "准备中")
                .font(.largeTitle)
                .foregroundColor(.white)
        }

    }
}

struct PlayerButton: View {
    // 单一数据源(single source of truth，SSOT)概念
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
