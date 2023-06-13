//
//  View+Extensions.swift
//  hellocoffee
//
//  Created by 吴彤 on 2023/6/13.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        switch value {
            case true:
                self
            case false:
                EmptyView()
        }
    }
    
}

