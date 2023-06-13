//
//  OrderCellView.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/13.
//

import SwiftUI

struct OrderCellView: View {
    let order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.name).bold()
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .opacity(0.5)
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
        }
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView(order: Order(
            name: "Test",
            coffeeName: "Test Coffee",
            total: 100,
            size: CoffeeSize.large
        ))
    }
}
