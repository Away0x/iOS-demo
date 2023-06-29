//
//  AnyLayout+.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension AnyLayout {
    static func useVStack(if condition: Bool, spacing: CGFloat, @ViewBuilder content: @escaping () -> some View) -> some View {
        let layout = condition ? AnyLayout(VStackLayout(spacing: spacing)) : AnyLayout(HStackLayout(spacing: spacing))
        
        return layout(content)
    }
}
