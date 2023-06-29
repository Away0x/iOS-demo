//
//  Sheet.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension FoodListScreen {
    enum Sheet: View, Identifiable {
        case newFood((Food) -> Void)
        case editFood(Binding<Food>)
        case foodDetail(Food)
        
        var id: UUID {
            switch self {
                case .newFood:               return UUID()
                case .editFood(let binding): return binding.wrappedValue.id
                case .foodDetail(let food):  return food.id
            }
        }
        
        var body: some View {
            switch self {
                case .newFood(let onSubmit):
                    FoodForm(food: .new, onSubmit: onSubmit)
                case .editFood(let binding):
                    FoodForm(food: binding.wrappedValue) { binding.wrappedValue = $0 }
                case .foodDetail(let food):
                    FoodDetailSheet(food: food)
                         // .environment(\.dynamicTypeSize, .accessibility5)
            }
        }
    }
}