//
//  ContentView.swift
//  HelicopterGame
//
//  Created by Divay Bhasin on 5/10/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var heliPosition = CGPoint(x: 100, y: 100)
    @State private var obstPosition = CGPoint(x: 1000, y: 300)
    @State private var isGamePaused = false
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State public var currentScore: Int = 0
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "highScore")
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Helicopter()
                    .position(self.heliPosition)
                    .onReceive(timer) { _ in
                        self.gravity()
                    }
                
                BoundingBox()
                
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer) { _ in
                        self.obstMove()
                    }
                Text("Score: \(self.currentScore) | High Score: \(self.highScore)")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10)
                
                self.isGamePaused ? Button ("Resume") { self.resume() } : nil
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            self.heliPosition.y -= 50
                        }
                    })
            .onReceive(self.timer) { _ in
                self.collisionDetection()
                self.currentScore += 1
                if self.currentScore > self.highScore {
                    self.highScore = self.currentScore
                    UserDefaults.standard.set(self.highScore, forKey: "highScore")
                }
            }
        }
        .navigationBarHidden(!isGamePaused)
        .ignoresSafeArea()
    }
    
    func gravity() {
        withAnimation {
            self.heliPosition.y += 20
        }
    }
    
    func obstMove() {
        if self.obstPosition.x > 0 {
            withAnimation {
                self.obstPosition.x -= 20
            }
        } else {
            self.obstPosition.x = 1000
            self.obstPosition.y = CGFloat.random(in: 0...350)
        }
        switch currentScore {
        case 0...99:
            withAnimation {
                self.obstPosition.x -= 25
            }
        case 100...199:
            withAnimation {
                self.obstPosition.x -= 30
            }
        case 200...299:
            withAnimation {
                self.obstPosition.x -= 40
            }
        case 300...399:
            withAnimation {
                self.obstPosition.x -= 45
            }
        case 400...499:
            withAnimation {
                self.obstPosition.x -= 50
            }
        case 500...599:
            withAnimation {
                self.obstPosition.x -= 55
            }
        case 600...699:
            withAnimation {
                self.obstPosition.x -= 60
            }
        case 700...799:
            withAnimation {
                self.obstPosition.x -= 65
            }
        case 800...899:
            withAnimation {
                self.obstPosition.x -= 70
            }
        case 900...999:
            withAnimation {
                self.obstPosition.x -= 75
            }
        case 1000...1099:
            withAnimation {
                self.obstPosition.x -= 80
            }
        default:
            withAnimation {
                self.obstPosition.x -= 25
            }
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    }
    
    func resume() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        self.obstPosition.x = 1000
        self.heliPosition = CGPoint(x: 100, y: 100)
        self.isGamePaused = false
        self.currentScore = 0
        self.currentScore += 1
    }
    
    func collisionDetection() {
        
        if abs(heliPosition.x - obstPosition.x) < (24 + 10) && abs(heliPosition.y - obstPosition.y) < (10 + 100) || heliPosition.y == 0 || heliPosition.y == 400 || heliPosition.y > 400 {
              self.pause()
              self.isGamePaused = true
          }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
