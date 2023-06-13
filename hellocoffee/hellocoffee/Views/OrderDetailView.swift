//
//  OrderDetailView.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/13.
//

import SwiftUI

struct OrderDetailView: View {
    
    let orderId: Int
    @EnvironmentObject private var viewModel: CoffeeViewModel
    @State private var isPresented: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            if let order = viewModel.orderById(orderId) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(order.size.rawValue).opacity(0.5)
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    HStack {
                        Spacer()
                        Button("Delete order", role: .destructive) {
                            Task {
                                await deleteOrder()
                            }
                        }
                        Button("Edit order") {
                            isPresented = true
                        }
                        Spacer()
                    }.sheet(isPresented: $isPresented) {
                        AddCoffeeView(order: order)
                    }
                }
            }
            
            Spacer()
        }.padding()
    }
}

// MARK: ACTIONS
extension OrderDetailView {
    private func deleteOrder() async {
        do {
            try await viewModel.deleteOrder(orderId)
            dismiss()
        } catch {
            print(error)
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        let service = Services(baseURL: config.environment.baseURL)
        OrderDetailView(orderId: 1).environmentObject(CoffeeViewModel(service: service))
    }
}
