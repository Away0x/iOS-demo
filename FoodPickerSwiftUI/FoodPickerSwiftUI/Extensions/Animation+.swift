//
//  Animation+.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension Animation {
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}
