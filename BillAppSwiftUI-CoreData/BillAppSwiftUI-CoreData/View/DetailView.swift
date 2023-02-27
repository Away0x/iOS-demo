//
//  DetailView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import SwiftUI

struct DetailView: View {
    private let types = ["日用百货", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var bill: Bill
    @State private var draftBillItem = DraftBillItem()
    
    var billItem: BillItem?
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }.padding(.horizontal)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print(222, draftBillItem.name)
                    if isAddingPage {
                        // 新增数据
                        bill.addItem(item: draftBillItem)
                    } else {
                        // 修改数据
                        if let item = billItem {
                            bill.editItem(id: item.id!, draftItem: draftBillItem)
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
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
                .environmentObject(Bill())
        }
    }
}
