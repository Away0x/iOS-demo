//
//  AppStorageDemo.swift
//  BillAppSwiftUI
//
//  Created by 吴彤 on 2023/2/26.
//

import SwiftUI

struct AppStorageDemo: View {
    // @State var nickName = ""
    
    // 每次修改都会实时同步存储到本地 user defaults 中
    // AppStorage 实际上是 State 和 UserDefaults 的结合
    @AppStorage("nickName") var nickName = ""
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        Form {
            Section {
                TextField("输入昵称", text: $nickName)
                Text(nickName)
            }
            Section {
                Toggle("深色模式", isOn: $isDarkMode)
            }
        }
    }
}

struct AppStorageDemo_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageDemo()
    }
}
