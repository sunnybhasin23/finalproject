//
//  Helicopter.swift
//  HelicopterGame
//
//  Created by Divay Bhasin on 5/10/24.
//

import SwiftUI

struct Helicopter: View {
    
    
    
    let rows = 8
    let columns = 8
    let size: CGFloat = 6
    let heliBlocks: [[Color]] = [[.gray, .gray, .gray, .gray, .gray, .gray, .gray, .gray],
                                 [.clear, .clear, .clear, .gray, .red, .clear, .clear, .clear],
                                 [.green, .clear, .green, .green, .green, .green, .yellow, .clear],
                                 [.green, .green, .green, .green, .green, .green, .yellow, .yellow],
                                 [.green, .green, .green, .green, .green, .green, .green, .green],
                                 [.clear, .green, .green, .green, .green, .green, .green, .red],
                                 [.clear, .clear, .gray, .clear, .clear, .clear, .gray, .clear],
                                 [.clear, .gray, .gray, .gray, .gray, .gray, .gray, .gray]]
    
    let crashBlocks: [[Color]] = [ [.clear, .orange, .clear, .clear, .orange, .clear, .orange, .clear],
                                  [.orange, .orange, .yellow, .clear, .orange, .orange, .orange, .orange],
                                  [.orange, .yellow, .orange, .orange, .yellow, .orange, .orange, .orange],
                                  [.orange, .yellow, .yellow, .yellow, .yellow, .yellow, .yellow, .orange],
                                  [.orange, .yellow, .yellow, .yellow, .orange, .yellow, .yellow, .clear],
                                  [.green, .yellow, .green, .orange, .green, .green, .yellow, .yellow],
                                  [.green, .green, .green, .yellow, .green, .green, .green, .green],
                                  [.clear, .green, .green, .green, .green, .green, .green, .red],]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ForEach((0...self.rows - 1), id: \.self) { row in
                
                HStack(spacing: 0) {
                    
                    ForEach((0...self.columns - 1), id: \.self) { col in
                        
                        VStack(spacing: 0) {
                            
                            Pixel(size: self.size, color: self.heliBlocks[row][col])
                        }
                    }
                }
            }
        }
    }
}

struct Previews_Helicopter_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Helicopter()
            .previewInterfaceOrientation(.landscapeLeft)/*@END_MENU_TOKEN@*/
    }
}
