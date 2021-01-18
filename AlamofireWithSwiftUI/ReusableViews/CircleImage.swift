//
//  CircleImage.swift
//  AlamofireWithSwiftUI
//
//  Created by ahmad shiddiq on 19/01/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    var size: CGFloat
    var body: some View {
        Image(imageName)
        .resizable()
        .frame(width: size, height: size)
        .scaledToFit()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 1))
        .shadow(radius: 5)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "icon_laughing", size: 50)
    }
}

