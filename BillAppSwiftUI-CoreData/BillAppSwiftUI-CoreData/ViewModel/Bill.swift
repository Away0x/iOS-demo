//
//  Bill.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2022/12/30.
//

import Foundation

let kBillItemsKey = "kBillItemsKey"

class Bill : ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext

    @Published
    var items: [BillItem] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let request = BillItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "updatedAt", ascending: false)]
        
        do {
            items = try viewContext.fetch(request)
        } catch {
            fatalError("从SQLite里面取数据失败: \(error)")
        }
    }
    
    func addItem(item: DraftBillItem) {
        let billItem = BillItem(context: viewContext)
        billItem.id = UUID().uuidString
        billItem.name = item.name
        billItem.type = item.type
        billItem.price = item.price
        billItem.updatedAt = Date()
        
        print(billItem)
        saveViewContext()
        getItems()
    }
    
    func addItem(name: String, type: String, price: String) {
        let billItem = BillItem(context: viewContext)
        billItem.id = UUID().uuidString
        billItem.name = name
        billItem.type = type
        billItem.price = price
        billItem.updatedAt = Date()
        
        saveViewContext()
        getItems()
    }
    
    func editItem(id: String, draftItem: DraftBillItem) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            let billItem = items[index]
            billItem.name = draftItem.name
            billItem.type = draftItem.type
            billItem.price = draftItem.price
            billItem.updatedAt = Date()
        }
        
        saveViewContext()
        getItems()
        
    }
    
    func deleteItem(item: BillItem) {
        viewContext.delete(item)
        saveViewContext()
        getItems()
    }
}

extension Bill {
    func saveViewContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
