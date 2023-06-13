//
//  ContentView.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var viewModel: CoffeeViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.orders.isEmpty {
                    Text("No orders available!")
                } else {
                    List {
                        ForEach(viewModel.orders) { order in
                            NavigationLink(value: order.id) {
                                OrderCellView(order: order)
                            }
                        }.onDelete(perform: deleteOrder)
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { orderId in
                 OrderDetailView(orderId: orderId)
            })
            .task {
                await populateOrders()
            }
            .sheet(isPresented: $isPresented, content: {
                AddCoffeeView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add New Order") {
                        isPresented = true
                    }
                }
            }
        }
    }
}

// MARK: ACTIONS
extension ContentView {
    private func populateOrders() async {
        do {
            try await viewModel.populateOrders()
        } catch {
            print(error)
        }
    }
    
    private func deleteOrder(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let order = viewModel.orders[index]
            guard let orderId = order.id else {
                return
            }
            
            Task {
                do {
                    try await viewModel.deleteOrder(orderId)
                } catch {
                    print(error)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        let service = Services(baseURL: config.environment.baseURL)
        ContentView().environmentObject(CoffeeViewModel(service: service))
    }
}
