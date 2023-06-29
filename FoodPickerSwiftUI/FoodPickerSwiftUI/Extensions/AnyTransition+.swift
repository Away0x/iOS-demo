//
//  AnyTransition+.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension AnyTransition {
    static let moveUpWithOpacity = Self.move(edge: .top).combined(with: .opacity)
    
    static let moveLeadingWithOpacity = Self.move(edge: .leading).combined(with: .opacity)
    
    static let delayInsertionOpacity = Self.asymmetric(
        insertion: .opacity
                    .animation(.easeInOut(duration: 0.5).delay(0.2)),
        removal: .opacity
                    .animation(.easeInOut(duration: 0.4)))
}
