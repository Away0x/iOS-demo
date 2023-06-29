//
//  FoodDetailSheet.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension FoodListScreen {
    private struct FoodDetailSheetHeightKey: PreferenceKey {
        static var defaultValue: CGFloat = 300
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
    
    struct FoodDetailSheet: View {
        @Environment(\.dynamicTypeSize) private var textSize // 获取字体
        @State private var foodDetailHeight: CGFloat = FoodDetailSheetHeightKey.defaultValue
        
        let food: Food
        
        var body: some View {
            // 字体如果是辅助模式, 用 vstack 显示, 否则 hstack
            let shouldUseVStack = textSize.isAccessibilitySize || food.image.count > 1
            
            AnyLayout.useVStack(if: shouldUseVStack, spacing: 30) {
                Text(food.image)
                    .font(.system(size: 100))
                    .lineLimit(1)
                    .minimumScaleFactor(shouldUseVStack ? 1 : 0.5)
                
                Grid(horizontalSpacing: 30, verticalSpacing: 12) {
                    buildNutritionView(title: "熱量", value: food.$calorie)
                    buildNutritionView(title: "蛋白質", value: food.$protein)
                    buildNutritionView(title: "脂肪", value: food.$fat)
                    buildNutritionView(title: "碳水", value: food.$carb)
                }
            }
            .padding()
            .padding(.vertical)
//            .overlay {
//                // 获取到 view 的尺寸信息, 用 preference 来传递给其他 view
//                // https://www.jianshu.com/p/8fae61b5993c
//                // 在SwiftUI中，父View可以分享environment给子View使用，同时订阅environment的变化，但是有时候子View需要传递数据给父View，在SwiftUI这种情况通常使用Preferences
//                GeometryReader { proxy in
//                    // 用 clear 做一个透明的中介来设置 preference
//                    Color.clear.preference(key: FoodDetailSheetHeightKey.self,
//                                           value: proxy.size.height)
//                }
//            }
            // 封装的 extenstion, 等同上面的代码
            .readGeometry(\.size.height, key: FoodDetailSheetHeightKey.self)
            // preference 更新时触发
            .onPreferenceChange(FoodDetailSheetHeightKey.self) {
                foodDetailHeight = $0
            }
            // 再通过获取到 view 的尺寸来设置 sheet 的高度, 保证 sheet 和子 view 高度一样
            .presentationDetents([.height(foodDetailHeight)])
        }
        
        private func buildNutritionView(title: String, value: String) -> some View {
            GridRow {
                Text(title).gridCellAnchor(.leading)
                Text(value).gridCellAnchor(.trailing)
            }
        }
    }
}
