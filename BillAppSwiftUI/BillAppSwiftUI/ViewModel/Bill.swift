//
//  Bill.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/30.
//

import Foundation

// viewModel 一般最好定义成 class 类型, 因为是引用类型, 用于组件间传值比较方便
class Bill : ObservableObject {
    // 可以理解为 @State 的升级版
    // 一个可被订阅的数据 (一旦数据变动, 相关视图都会被刷新)
    // Published 修饰的数据需要是值类型的数据
    @Published
    var items = [
        BillItem(name: "Swift教程", type: "教育培训", price: "500"),
        BillItem(name: "MacBook", type: "数码电器", price: "15000"),
        BillItem(name: "iPhone", type: "数码电器", price: "5000"),
    ]
    
    func addItem(item: DraftBillItem) {
        items.append(BillItem.fromDraftItem(item))
        // 通知订阅数据的视图进行刷新, Published 的数据每次修改都会触发该方法
        // 一些特殊情况, 数据可以不用 Published, 手动发布通知
        // objectWillChange.send()
    }
    
    func editItem(id: UUID, item: DraftBillItem) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index] = BillItem.fromDraftItem(item)
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func deleteItem(item: BillItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }
}
