//
//  draftBillItem.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2023/1/29.
//

import Foundation

class DraftBillItem: ObservableObject {
    @Published var name: String = ""
    @Published var type: String = "日用百货"
    @Published var price: String = ""
    
    init() {}
    
    init(_ billItem: BillItem) {
        name = billItem.name
        type = billItem.type
        price = billItem.price
    }
}
