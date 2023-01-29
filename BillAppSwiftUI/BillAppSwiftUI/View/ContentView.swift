//
//  ContentView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import SwiftUI
// Combine: 负责在 SwiftUI 中处理数据的框架, 已经被默认包含在 SwiftUI 框架中了


struct ContentView: View {
    // @State private var showDetailView = false
    
    // 一开始实例化 vm 的时候使用 StateObject, 后续传递使用则可以用 ObservedObject
    // StateObject 该 ContentView rerender 时, 不会重新实例化 Bill, 导致数据被恢复到初始状态
    // 如果用的是 ObservedObject 则会重新实例化
    // 规则: 只要是需要实例化的就用 StateObject, 否则用 ObservedObject
    @StateObject
    private var billVM = Bill()
    
    @State private var isUnread = true
    
    var body: some View {
        NavigationView {
            // 自定义 label
//            Label {
//                Text("AAA").font(.title)
//                Text("BBB").font(.body).foregroundColor(.secondary)
//            } icon: {
//                Circle()
//                    .fill(.green)
//                    .frame(width: 55, height: 55)
//                    .overlay(
//                        Text("W")
//                            .font(.title)
//                            .foregroundColor(.white)
//                    )
//            }
            
            // 滑动删除的实现方式
            // 1. List + ForEach, onDelete 中进行删除
//            List {
//                // 需要左滑删除 item, 需要用 foreach 循环(onDelete 是 ForEach 才有的), 这样 list 就不用循环了但是还是需要包装一层 (list 样式)
//                ForEach(billVM.items) { item in
//                    // 注意: link 会给跳转的 view 加上一层 navigationView
//                    // 所以跳转的 view 就不需要自己包一层 navigationView 了
//                    // 如果不用 link 跳转而是使用 present 形式弹出的子 view 则需要自己包装一层 navigationView
//                    NavigationLink {
//                        DetailView(billVM: billVM, billItem: item)
//                    } label: {
//                        BillItemView(billItem: item)
//                    }
//                }
//                .onDelete(perform: billVM.deleteItem)
//            }
            // 2. swipe action 实现 (更灵活)
            List(billVM.items) { item in
                NavigationLink {
                    DetailView(billVM: billVM, billItem: item)
                } label: {
                    BillItemView(billItem: item)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        isUnread.toggle()
                    } label: {
                        if isUnread {
                            Label("标记为已读", systemImage: "envelope.open")
                        } else {
                            Label("标记为未读", systemImage: "envelope.badge")
                        }
                    }
                    .tint(isUnread ? .gray : .blue)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        billVM.deleteItem(item: item)
                    } label: {
                        Label("Delete", systemImage: "delete.backward.fill")
                    }
                    
                    Button {
                        print("标记账单")
                    } label: {
                        Label("标记账单", systemImage: "flag")
                    }
                    .tint(.orange)
                }
            }
            .navigationTitle("账单")
            .toolbar {
                // link 跳转
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        DetailView(billVM: billVM)
                    } label: {
                        Image(systemName: "plus").foregroundColor(.secondary)
                    }.padding(.horizontal)
                }
                
                // 按钮触发事件进行跳转
//                Button {
//                   showDetailView = true
//                } label: {
//                    Image(systemName: "plus")
//                        .foregroundColor(.secondary)
//                }.padding(.horizontal)
            }
        }
        .navigationViewStyle(.stack)
        // present 弹出页面 (顶部会有一部分没覆盖)
        // .sheet(isPresented: $showDetailView) { DetailView() }
        // present 全屏覆盖
        // .fullScreenCover(isPresented: $showDetailView) { DetailView() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Auth())
    }
}
