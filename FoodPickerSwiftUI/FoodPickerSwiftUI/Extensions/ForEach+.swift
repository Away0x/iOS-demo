//
//  ForEach+.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/7/3.
//

import SwiftUI

extension ForEach where Data.Element: Identifiable & View, ID == Content.ID, Content == Data.Element {
    init(_ data: Data) {
        self.init(data) { $0 }
    }
}
