//
//  NumberFormatter+Extensions.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/13.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
