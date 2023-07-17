//
//  View+Preview.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/13.
//

import SwiftUI

extension View {
    func previewEnvironmentObject(manager: CatAPIManager = .preview) -> some View {
        environmentObject(manager)
    }
}
