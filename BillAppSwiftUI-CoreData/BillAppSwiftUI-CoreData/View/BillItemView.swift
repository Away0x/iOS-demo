//
//  BillItemView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/30.
//

import SwiftUI

struct BillItemView: View {
    // CoreData 中 BillItem 是个引用类型, 不是 struct, 所以如果要传入托管对象(引用对象), 需要用 ObservedObject 修饰, 否则视图刷新会有问题
    @ObservedObject var billItem: BillItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(billItem.name ?? "")
                    .font(.headline)
                Text(billItem.type ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(billItem.price ?? "")
        }
    }
}

