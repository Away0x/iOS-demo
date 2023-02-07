//
//  Modifiers.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import SwiftUI

struct BoldTitleWithPadding: ViewModifier {
    let edges: Edge.Set
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(edges, 5)
    }
}

extension View {
    func boldTitleWithPadding(_ edges: Edge.Set = .bottom) -> some View {
        modifier(BoldTitleWithPadding(edges: edges))
    }
}

