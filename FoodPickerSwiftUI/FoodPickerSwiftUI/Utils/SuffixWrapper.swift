//
//  SuffixWrapper.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/20.
//

import Foundation

@propertyWrapper struct Suffix: Equatable {
    var wrappedValue: Double
    private let suffix: String
    
    init(wrappedValue: Double, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }
    
    var projectedValue: String {
        wrappedValue.formatted() + " \(suffix)"
    }
}
