//
//  BillItemView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/30.
//

import SwiftUI

struct BillItemView: View {
    var billItem: BillItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(billItem.name)
                    .font(.headline)
                Text(billItem.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(billItem.price)
        }
    }
}

struct BillItemView_Previews: PreviewProvider {
    static var previews: some View {
        BillItemView(billItem: BillItem(name: "SwiftUI", type: "教育培训", price: "123"))
    }
}
