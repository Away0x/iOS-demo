//
//  GeometryReaderView.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//  获取父视图宽高

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack {
            // GeometryReader 获取到父视图的宽高
            // 放在最外层就可以获取到屏幕的宽高
            GeometryReader { proxy in
                // proxy.frame(in: .local).minX 获取在父视图的坐标
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: proxy.size.width/2, height: proxy.size.height/2)
            }
        }
//        .frame(width: 300, height: 300)
        .background(.green)
        .ignoresSafeArea()
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
