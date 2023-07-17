//
//  AsyncImageDemo.swift
//  NetworkSwiftUI
//
//  Created by 吴彤 on 2023/7/5.
//

import SwiftUI

// AsyncImage 不会 cache image
struct AsyncImageDemo: View {
    let url = URL(string: "https://images.unsplash.com/photo-1678880032033-d954b408963c")!
    
    var body: some View {
        VStack {
            VStack {
//                AsyncImage(url: url) { image in
//                    image.resizable().scaledToFit()
//                } placeholder: {
//                    ProgressView()
//                }
                
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().scaleEffect(3)
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Text("图片无法显示")
                    @unknown default:
                        fatalError("This has not been implemented.")
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageDemo()
    }
}
