//
//  ToggleView.swift
//  StateBindingSwiftUI
//
//  Created by 吴彤 on 2022/11/22.
//

import SwiftUI

struct ToggleView: View {
    // 数据-->视图
    // 视图-->数据
    @State private var isOn = false
    
    var body: some View {
        Toggle("深色模式", isOn: $isOn).padding()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
