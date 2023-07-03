//
//  FoodForm.swift
//  FoodPickerSwiftUI
//
//  Created by 吴彤 on 2023/6/29.
//

import SwiftUI

extension FoodListScreen {
    struct FoodForm: View {
        @Environment(\.dismiss) private var dismiss
        
        @FocusState private var field: MyField?
        @State var food: Food // 如果想要修改会影响到外部, 可以用 Binding
        var onSubmit: (Food) -> Void
        
        private var isNotValid: Bool { food.name.isEmpty || food.image.count > 2 }
        
        private var invalidMessage: String? {
            if food.name.isEmpty { return "請輸入名稱" }
            if food.image.count > 2 { return "圖示字數過多" }
            return .none
        }
        
        var body: some View {
            NavigationStack {
                VStack {
                    titleBar
                                        
                    formView
                    
                    saveButton
                }
                .background(.groupBg)
                .multilineTextAlignment(.trailing)
                .font(.title3)
                .scrollDismissesKeyboard(.interactively)
                // keyboard toolbar (注意要加上 Navigation 才生效)
                .toolbar(content: buildKeyboardTools)
            }
        }
    }
}

// MARK: Subviews
private extension FoodListScreen.FoodForm {
    var titleBar: some View {
        HStack {
            Label("編輯食物資訊", systemImage: .pencil)
                .font(.title.bold())
                .foregroundColor(.accentColor)
                .push(to: .leading)
            
            Button {
                dismiss()
            } label: {
                SFSymbol.xmark
                    .font(.largeTitle.bold())
                    .foregroundColor(.secondary)
            }
        }.padding([.horizontal, .top])
    }
    
    var formView: some View {
        Form {
//            Section {
//                Text("Content")
//            } header: {
//                Text("Header")
//            } footer: {
//                Text("Footer")
//            }

            
            LabeledContent("名稱") {
                TextField("必填", text: $food.name)
                    .submitLabel(.next) // keyboard 的 return 按钮变成 next
                    .focused($field, equals: .title) // field = .title 时, 该 input 进入 focus 状态
            }
            
            LabeledContent("圖示") {
                TextField("最多輸入 2 個字元", text: $food.image)
                    .focused($field, equals: .image)
            }
            
            buildNumberField(title: "熱量", value: $food.$calorie, field: .calories)
            buildNumberField(title: "蛋白質", value: $food.$protein, field: .protein)
            buildNumberField(title: "脂肪", value: $food.$fat, field: .fat)
            buildNumberField(title: "碳水", value: $food.$carb, field: .carb)
        }
//        .formStyle(.columns)
        .padding(.top, -16)
    }
    
    var saveButton: some View {
        Button {
            dismiss()
            onSubmit(food)
        } label: {
            Text(invalidMessage ?? "儲存")
                .bold()
                .maxWidth()
        }
        .mainButtonStyle()
        .padding()
        .disabled(isNotValid)
    }
    
    // value 是一个嵌套的 binding
    func buildNumberField<Unit: MyUnitProtocol & Hashable>(title: String, value: Binding<Suffix<Unit>>, field: MyField) -> some View {
        LabeledContent(title) {
            HStack {
                TextField(
                    "",
                    // 由于是嵌套的 binding, 所以需要自己包装一层才能进行存取
                    value: Binding(
                        get: { value.wrappedValue.wrappedValue },
                        set: { value.wrappedValue.wrappedValue = $0 }
                    ),
                    format: .number.precision(.fractionLength(1))
                )
                    .focused($field, equals: field)
                    .keyboardType(.decimalPad)
                
                if Unit.allCases.count <= 1 {
                    value.unit.wrappedValue.font(.body)
                } else {
                    Picker("单位", selection: value.unit) {
                        ForEach(Unit.allCases)
                    }.labelsHidden()
                }
            }
        }
    }
    
    func buildKeyboardTools() -> some ToolbarContent {
        ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            Button(action: goPreviousField) { SFSymbol.chevronUp }
            Button(action: goNextField) { SFSymbol.chevronDown }
        }
    }
}

// MARK: Focus Handling
private extension FoodListScreen.FoodForm {
    func goPreviousField() {
        guard let rawValue = field?.rawValue else { return }
        field = .init(rawValue: rawValue - 1)
    }
    
    func goNextField() {
        guard let rawValue = field?.rawValue else { return }
        field = .init(rawValue: rawValue + 1)
    }
}

private enum MyField: Int {
    case title, image, calories, protein, fat, carb
}

private extension TextField where Label == Text {
    // 拓展了 TextField 的 focused function
    func focused(_ field: FocusState<MyField?>.Binding, equals this: MyField) -> some View {
        submitLabel(this == .carb ? .done : .next)
        .focused(field, equals: this)
        .onSubmit { field.wrappedValue = .init(rawValue: this.rawValue + 1) }
    }
}

struct FoodForm_Previews: PreviewProvider {
    static var previews: some View {
        FoodListScreen.FoodForm(food: Food.examples.first!) { _ in }
    }
}
