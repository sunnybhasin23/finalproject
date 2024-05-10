//
//  BoundingBox.swift
//  HelicopterGame
//
//  Created by Divay Bhasin on 5/10/24.
//

import SwiftUI

struct BoundingBox: View {
    
    let stationaryW: CGFloat = 800
    let height: CGFloat = 5
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: stationaryW, height: height)
                .foregroundColor(.purple)
            Spacer()
            Rectangle()
                .frame(width: stationaryW, height: height)
                .foregroundColor(.purple)
        }
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
