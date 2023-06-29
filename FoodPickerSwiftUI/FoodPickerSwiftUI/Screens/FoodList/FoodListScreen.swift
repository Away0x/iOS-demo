//
//  FoodListView.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/20.
//

import SwiftUI

struct FoodListScreen: View {
    @Environment(\.editMode) var editMode
    @State private var food = Food.examples
    @State private var selectedFoodID = Set<Food.ID>()
    @State private var sheet: Sheet?
    
    private var isEditing: Bool { editMode?.wrappedValue == .active }
    
    var body: some View {
        VStack(alignment: .leading) {
            titleBar
            
            List($food, editActions: .all, selection: $selectedFoodID, rowContent: buildFoodRow)
                .listStyle(.plain)
                .padding(.horizontal)
        }
        // 注意 list 的 backgroud 用的是分组背景色(light, dark 颜色不一样)
        .background(.groupBg)
        .safeAreaInset(edge: .bottom, content: buildFloatButton)
        // 当 item 从没有变成有的时候, sheet 就会显示
        .sheet(item: $sheet)
    }
}

// MARK: Subviews
private extension FoodListScreen {
    var titleBar: some View {
        HStack {
            Label("食物清单", systemImage: .forkAndKnife)
                .font(.title.bold())
                .foregroundColor(.accentColor)
                .push(to: .leading)
            
            EditButton()
                .buttonStyle(.bordered)
                .environment(\.locale, .init(identifier: "zh"))
        }
        .padding()
    }
    
    func buildFloatButton() -> some View {
        // 两个 button 始终都存在, 保证切换时高度一致, 就不会产生变化导致其他部分重绘
        // 如果用 if 来进行切换就会有重绘问题
        ZStack {
            removeButton
                .transition(.moveLeadingWithOpacity.animation(.easeInOut))
                .opacity(isEditing ? 1 : 0)
                .id(isEditing)
            
            addButton
                .scaleEffect(isEditing ? 0.00001 : 1)
                .opacity(isEditing ? 0 : 1)
                .animation(.easeInOut, value: isEditing)
                .push(to: .trailing)
        }
    }
    
    func buildFoodRow(foodBinding: Binding<Food>) -> some View {
        let food = foodBinding.wrappedValue
        return HStack {
            Text(food.name)
                .padding(.vertical, 10)
                .push(to: .leading)
                .contentShape(Rectangle()) // 如果没有形状, 则只有字的地方才能被点击
                .onTapGesture {
                    if isEditing {
                        selectedFoodID.insert(food.id)
                        return
                    }
                    sheet = .foodDetail(food)
                }
            
            if isEditing {
                SFSymbol.pencil
                    .font(.title2.bold())
                    .foregroundColor(.accentColor)
                    .onTapGesture { sheet = .editFood(foodBinding) }
            }
        }
    }
    
    var addButton: some View {
        Button {
            sheet = .newFood { food.append($0) }
        } label: {
            SFSymbol.plus
                .font(.system(size: 50))
                .padding()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, Color.accentColor.gradient)
        }
    }
    
    var removeButton: some View {
        Button {
            withAnimation {
                food = food.filter { !selectedFoodID.contains($0.id) }
            }
        } label: {
            Text("刪除已選項目")
                .font(.title2.bold())
                .maxWidth()
        }
        .mainButtonStyle(shape: .roundedRectangle(radius: 8))
        .padding(.horizontal, 50)
    }
}

// MARK: Preview
struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListScreen()
            // .previewDevice(.iPhoneSE)
            // 强制设置为 edit=active, 可以用 Binding 的 constant 方法来创建 binding value
            //.environment(\.editMode, .constant(.active))
    }
}
