//
//  DetailView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import SwiftUI

struct DetailView: View {
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    
    // 从系统中获取到 dismiss
    @Environment(\.dismiss) private var dismiss
    
    // 注意下面三种存储 state 的方法
    // 1. 组件内部的 state
    @State private var draftBillItem = DraftBillItem()
    
    // 2. 获取的注入在 parent view 的 state (通过 environmentObject 传入)
    @EnvironmentObject var auth: Auth
    
    // 3. 传入的 state
    @ObservedObject var billVM: Bill
    
    // 传入当前正在编辑的 item (不传为新增)
    var billItem: BillItem?
    // 是否为新增账单 (计算属性)
    var isAddingPage: Bool { billItem == nil }
    
    var body: some View {
        Form {
            Section("账单名") {
                TextField("收入或支出来源", text: $draftBillItem.name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $draftBillItem.type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("账单金额") {
                TextField("收入或支出金额", text: $draftBillItem.price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(isAddingPage ? "添加账单" : "编辑账单")
        // 自定义返回按钮
        // 1. 隐藏系统返回按钮
        // 2. 定义 toolbar item
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // 直接设置 button 是 navigationBar 右边的按钮
            // Button { dismiss() } label: { Text("保存").foregroundColor(.primary) }.padding(.horizontal)
            // 左右都需要设置时, 需要 toolbaritem
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }.padding(.horizontal)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isAddingPage {
                        // 新增数据
                        billVM.addItem(item: draftBillItem)
                    } else {
                        // 修改数据
                        if let item = billItem {
                            billVM.editItem(id: item.id, item: draftBillItem)
                        }
                    }
                    
                    dismiss()
                } label: {
                    Text("保存").foregroundColor(.primary)
                }.padding(.horizontal)
            }
        }
        .onAppear {
            // 初始化编辑数据
            if let item = billItem {
                draftBillItem = DraftBillItem(item)
            }
            // 当前登录的用户
            print(auth.authenticatedUser?.name ?? "Unknown user")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(
                billVM: Bill(),
                billItem: BillItem(name: "Text", type: "日用百货", price: "200")
            ).environmentObject(Auth())
        }
    }
}
