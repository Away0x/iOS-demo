//
//  SwiftUIView-Image.swift
//  WeChatSwiftUI
//
//  Created by 吴彤 on 2022/11/21.
//

import SwiftUI

struct SwiftUIView_Image: View {
    var body: some View {
        Image("JackMa")
            .resizable()
//            .aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(width: 200, height: 200)
            .cornerRadius(5)
            .clipped()
//            .border(.orange, width: 5)
//            .clipShape(Circle()) 裁剪成圆形
    }
}

struct SwiftUIView_Image_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_Image()
    }
}
