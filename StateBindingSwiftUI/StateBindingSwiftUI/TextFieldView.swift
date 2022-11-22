//
//  TextFieldView.swift
//  StateBindingSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI


//TextField的prompt参数,是作为占位符显示
//但放在Form中之后,在各端效果不一样.iOS端title参数内容不显示,Mac端title参数会在TextField前面显示

//SecureField("输入密码", text: $name)

struct TextFieldView: View {
    enum Field: Hashable { case name, phone, address }
    
    @State private var name = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var addressLabelIndex = 0
    @State private var showAlert = false
    
    @FocusState private var isFocused: Field?
    
    let addressLabels = ["家", "公司", "学校"]
    
    var confirmMsg: String {
        """
        收货人是：\(name)
        手机是：\(phone)
        地址是：\(address)
        标签是：\(addressLabels[addressLabelIndex])
        """
    }
    
    var invalidInput: Bool {
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("收货人:")
                        TextField("请输入收货人姓名", text: $name)
                            .focused($isFocused, equals: .name)
                    }
                    HStack {
                        Text("手机号:")
                        TextField("请输入收货人手机号", text: $phone)
                            .keyboardType(.numberPad)
                            .focused($isFocused, equals: .phone)
                    }
                    HStack {
                        Text("详细地址:")
                        TextField("请输入收货人地址", text: $address)
                            .focused($isFocused, equals: .address)
                    }
                }
                
                Section {
                    Picker("标签", selection: $addressLabelIndex) {
                        ForEach(addressLabels.indices, id: \.self) { index in
                            Text(addressLabels[index])
                        }
                        //使用ForEach后,系统会把id赋给每个选项的tag,所以上述做法和下面是一样的
                        //Text("家").tag(0)
                        //Text("公司").tag(1)
                        //Text("学校").tag(2)
                    }
                } header: {
                    Text("标签")
                }.pickerStyle(.segmented)
                
                Section {
                    Button("填好了") {
                        if name.isEmpty {
                            isFocused = .name
                        } else if phone.isEmpty {
                            isFocused = .phone
                        } else if address.isEmpty {
                            isFocused = .address
                        } else {
                            isFocused = nil
                            showAlert = true
                            print("用户输入的没有问题,可以提交至服务器")
                        }
                    }
//                    .disabled(invalidInput)
                }
            }
            .navigationTitle("新增收货地址")
//            .navigationBarTitleDisplayMode(.inline)
            .textFieldStyle(.roundedBorder)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("完成") {
                        isFocused = nil
                    }
                }
            }
            // 滚动时隐藏 keyboard
            .scrollDismissesKeyboard(.immediately)
        }.navigationViewStyle(.stack)
        //从下往上弹出的弹框: https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:actions:)-46zbb
        // 可以放在任何地方, 不过一般放在最外层
        .alert("确认地址", isPresented: $showAlert) {
            Button("知道了", role: .cancel) { }
        } message: {
            Text(confirmMsg)
        }
        .onAppear {
            // 因为 FocusState 不支持设置默认值, 所以要这样设置初始值
            // 目前 swiftui 只能用这种不太优雅的方式
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isFocused = .name
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
