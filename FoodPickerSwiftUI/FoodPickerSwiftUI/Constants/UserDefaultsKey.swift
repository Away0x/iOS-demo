//
//  UserDefaultsKey.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/30.
//

import Foundation

extension UserDefaults {
    enum Key: String {
        case shouldUseDarkMode
        case unit
        case startTab
        case foodList
        case preferredEnergyUnit
        case preferredWieghtUnit
    }
}
