//
//  FoodPickerScreen.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/19.
//

import SwiftUI

// swiftui 的动画会进行结构和 id 的比对, 然后选择渲染动画
// 如果想让每次动画的判断都是全新的可以对 view 加上 id (.id(xxx)) 有点类似 react 的 key

struct FoodPickerScreen: View {
    @State private var selectedFood: Food?
    @State private var shouldShowDetail = false
    
    private let foods = Food.examples
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                foodImage
                
                Text("今天吃什么?").bold()
                
                selectedFoodInfoView
                
                Spacer().layoutPriority(1)
                
                selectedFoodButton
                resetButton
            }
            .padding()
            .frame(minHeight: UIScreen.main.bounds.height - 100)
            .font(.title)
            .mainButtonStyle()
            .animation(.mySpring, value: shouldShowDetail)
            .animation(.myEase, value: selectedFood)
        }
        .background(.bg2)
    }
}

// MARK: - Subviews
private extension FoodPickerScreen {
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1) // 当显示范围不够的时候, 进行缩放 (设置的是最小的可缩放比例)
                    .lineLimit(1)
                    
            } else {
                Image(selectedFood?.image ?? "dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(height: 250)
    }
    
    var foodNameView: some View {
        HStack {
            Text(selectedFood!.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .id(selectedFood!.name) // 每次都是不同的 id 框架会判断为不同的 view
                .transition(.delayInsertionOpacity)
            
            Button {
                shouldShowDetail.toggle()
            } label: {
                SFSymbol.info
                    .foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
        }
    }
    
    var foodDetailView: some View {
        VStack {
            if shouldShowDetail {
                HStack {
                    VStack(spacing: 12) {
                        Text("蛋白质")
                        Text(selectedFood!.$protein)
                    }
                    Divider().frame(width: 1).padding(.horizontal)
                    VStack(spacing: 12) {
                        Text("脂肪")
                        Text(selectedFood!.$fat)
                    }
                    Divider().frame(width: 1).padding(.horizontal)
                    VStack(spacing: 12) {
                        Text("碳水")
                        Text(selectedFood!.$carb)
                    }
                }
                .font(.title3)
                .padding()
                .roundedRectBackground()
                
                // grid 实现上面的功能布局
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        // Rectangle().frame(width: 1) // cell 垂直分隔线
                        Text("脂肪")
                        Text("碳水")
                    }
                    .frame(minWidth: 60)
                    
                    Divider()
                        // cell 计算宽度时不会考虑额外的空间, 不设置会撑满父 view
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow {
                        Text(selectedFood!.$protein)
                        Text(selectedFood!.$fat)
                        Text(selectedFood!.$carb)
                    }
                }
                .font(.title3)
                .padding()
                .roundedRectBackground()
                .transition(.moveUpWithOpacity)
            }
        }
        .maxWidth()
        .clipped()
    }
    
    @ViewBuilder
    var selectedFoodInfoView: some View {
        if let selectedFood {
            foodNameView
            
            Text("热量 \(selectedFood.$calorie)").font(.title2)
            
            foodDetailView
        }
    }
    
    var selectedFoodButton: some View {
        Button {
            selectedFood = foods.shuffled().first { $0 != selectedFood }
        } label: {
            Text(selectedFood == .none ? "告诉我!" : "换一个")
                .frame(width: 200)
                // 告诉 swiftui 这个 text 如何做动画, 否则默认会淡入淡出
                // identity 表示不做任何改变淡入淡出
                .transformEffect(.identity)
                // 关闭动画
                // .animation(.none, value: selectedFood)
        }
        .buttonStyle(.borderedProminent)
        .padding(.bottom, -15)
    }
    
    var resetButton: some View {
        Button {
            selectedFood = .none
            shouldShowDetail = false
        } label: {
            Text("重置")
                .frame(width: 200)
        }
        .buttonStyle(.bordered)
    }
}

extension FoodPickerScreen {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

struct FoodPickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodPickerScreen(selectedFood: .examples.first!)
        FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPad)
        FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPhoneSE)
    }
}
