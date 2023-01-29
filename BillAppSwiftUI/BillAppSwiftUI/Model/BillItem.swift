//
//  BillItem.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import Foundation

struct BillItem: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var price: String
    
    static func fromDraftItem(_ draftItem: DraftBillItem) -> BillItem {
        return BillItem(name: draftItem.name, type: draftItem.type, price: draftItem.price)
    }
}
