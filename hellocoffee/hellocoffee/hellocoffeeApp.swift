//
//  hellocoffeeApp.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/12.
//

import SwiftUI

@main
struct hellocoffeeApp: App {
    
    @StateObject private var viewModel: CoffeeViewModel
    
    init() {
        var config = Configuration()
        let service = Services(baseURL: config.environment.baseURL)
        _viewModel = StateObject(wrappedValue: CoffeeViewModel(service: service))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
