//
//  ContentView.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/4.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var bill: Bill
    
    @State private var isUnread = true
    
    var body: some View {
        NavigationView {
            List(bill.items) { item in
                NavigationLink {
                    DetailView(billItem: item)
                } label: {
                    BillItemView(billItem: item)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        isUnread.toggle()
                    } label: {
                        if isUnread {
                            Label("标记为已读", systemImage: "envelope.open")
                        } else {
                            Label("标记为未读", systemImage: "envelope.badge")
                        }
                    }
                    .tint(isUnread ? .gray : .blue)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        bill.deleteItem(item: item)
                    } label: {
                        Label("Delete", systemImage: "delete.backward.fill")
                    }
                    
                    Button {
                        print("标记账单")
                    } label: {
                        Label("标记账单", systemImage: "flag")
                    }
                    .tint(.orange)
                }
            }
            .navigationTitle("账单")
            .toolbar {
                // link 跳转
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Image(systemName: "plus").foregroundColor(.secondary)
                    }.padding(.horizontal)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Bill())
    }
}
