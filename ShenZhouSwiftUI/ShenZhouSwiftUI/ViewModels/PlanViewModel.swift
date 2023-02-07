//
//  PlanViewModel.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import Foundation

// 因为只有读取的要求, 没有增删改, 所以不需要遵循 ObservableObject
class PlanViewModel {
    var plans: [Plan]
    
    init() {
        plans = Bundle.main.decode(kPlansJSONFile)
    }
}

//let xx: [Plan] = Bundle.main.decode("plans")
