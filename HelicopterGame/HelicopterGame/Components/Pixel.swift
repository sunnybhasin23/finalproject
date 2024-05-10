//
//  Pixel.swift
//  HelicopterGame
//
//  Created by Divay Bhasin on 5/10/24.
//

import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
