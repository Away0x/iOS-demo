//
//  ContentView.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import SwiftUI

struct ContentView: View {
    let planVM = PlanViewModel()
    // 自适应网格, 最小宽 150
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(planVM.plans) { plan in
                        NavigationLink {
                            PlanView(plan: plan)
                        } label: {
                            VStack {
                                Image(plan.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(plan.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(plan.launchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                // 使宽度充满网格 (使用能使用的最大宽度)
                                .frame(maxWidth: .infinity)
                                .background(kLightBGColor)
                            }
                            // 和stroke区别,stroke是沿着视图的边里外都描, border是沿边往里描--见文档
                            // 目前版本, 想搞出圆角边框用 border 和 cornerRadius 不行, 需用以下方法
//                             .border(kLightBGColor, width: 10)
                            .cornerRadius(10)
                            .overlay( // 在网格上覆盖了一个带圆角的矩形
                                RoundedRectangle(cornerRadius: 10)
                                    // 通过 stroke 设置, 使矩形只留下边框
                                    .stroke(kLightBGColor)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("神舟飞船")
            .background(kDarkBGColor)
        }
        .navigationViewStyle(.stack)
        // 手动改深浅色模式,会应用于所有子视图(不包含 present 出来的页面)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
