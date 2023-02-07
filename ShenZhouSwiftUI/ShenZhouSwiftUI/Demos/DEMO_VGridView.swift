//
//  VGridView.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import SwiftUI

struct VGridView: View {
    var body: some View {
        // 每一列的配置(宽度和间距, 内容对其方式)
//        let columns = [
//            // spacing 列右侧的宽度
//            // GridItem(.flexible(minimum: 100)), 弹性网格撑满剩余空间
//            GridItem(.fixed(100), spacing: 20), // 固定网格
//            GridItem(.fixed(100), spacing: 20),
//            GridItem(.fixed(100))
//        ]
        
        // 自适应网格
        // 其他网格需要有几列就写几个元素, 这种网格不需要, 会自己自适应排列
        let adaptiveColumns = [
            GridItem(.adaptive(minimum: 50)),
            // 最右侧会有个 100 宽的格子, 其他的自适应布局
            GridItem(.fixed(100))
        ]
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(
//                columns: columns,
                columns: adaptiveColumns,
                // 滑动时固定
                pinnedViews: [.sectionHeaders, .sectionFooters]
    //            alignment: .leading 对其方式
    //            spacing: 20 每一行的间距
            ) {
    //            ForEach(0..<50) { index in
    //                RoundedRectangle(cornerRadius: 5)
    //                    .foregroundColor(Color(hue: 0.03*Double(index), saturation: 1, brightness: 1))
    //                    .frame(height: 50) // 内容不指定宽度, 会撑满网格
    //                    .overlay {
    //                        Text("\(index)")
    //                    }
    //            }
                
                // 分段
                ForEach(0..<5) { index in
                    Section {
                        ForEach(0..<10) { index2 in
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(hue: 0.03*Double(index * 10 + index2), saturation: 1, brightness: 1))
                                .frame(height: 50)
                                .overlay {
                                    Text("\(index * 10 + index2)")
                                }
                        }
                    } header: {
                        Text("Header \(index + 1)").bold().font(.title)
                            .frame(
                                maxWidth: .infinity, // 撑满父试图
                                alignment: .leading
                            )
                    } footer: {
                        Text("Footer \(index + 1)").bold().font(.title)
                            .frame(maxWidth: .infinity, // 撑满父试图
                                   alignment: .leading)
                            .padding(.bottom)
                    }

                }
            }.padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
        }
    }
}

struct VGridView_Previews: PreviewProvider {
    static var previews: some View {
        VGridView()
    }
}
