//
//  HGridView.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import SwiftUI

struct HGridView: View {
    var body: some View {
        let rows = [GridItem()] // 默认 flexable
        
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(1..<50) { index in
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(hue: 0.03*Double(index), saturation: 1, brightness: 1))
                            // 根据屏幕宽度设置
                            .frame(width: proxy.size.width * 0.3)
                            .overlay {
                                Text("\(index)")
                            }
                    }
                }
                .frame(height: proxy.size.width * 0.3) // 屏幕宽度的 30%
            }
        }
    }
}

struct HGridView_Previews: PreviewProvider {
    static var previews: some View {
        HGridView()
    }
}
