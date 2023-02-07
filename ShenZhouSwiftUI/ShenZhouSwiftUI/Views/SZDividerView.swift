//
//  SZDividerView.swift
//  ShenZhouSwiftUI
//
//  Created by 吴彤 on 2023/2/5.
//

import SwiftUI

struct SZDividerView: View {
    var color = kLightBGColor
    var width: CGFloat = 2
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .padding(.vertical)
    }
}

struct SZDividerView_Previews: PreviewProvider {
    static var previews: some View {
        SZDividerView()
    }
}
