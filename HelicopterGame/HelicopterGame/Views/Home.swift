//
//  Home.swift
//  HelicopterGame
//
//  Created by Divay Bhasin on 5/10/24.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Light mode home screen
                if colorScheme == .light {
                    LightHomeView(showingSheet: $showingSheet)
                }
                // Dark mode home screen
                else {
                    DarkHomeView(showingSheet: $showingSheet)
                }
            }
            .frame(width: 1000)
            .background(Color.black)

        }
        .navigationViewStyle(.stack)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct LightHomeView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Helicopter Game")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .opacity(0.8)
                        .cornerRadius(10)
                )
            Spacer()
            Image("Helicopter")
            
            NavigationLink(destination: ContentView()) {
                Text("Start")
                    .bold()
                    .frame(width: 280, height: 30)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()

        }
        .background(Color.black)
    }
}

struct DarkHomeView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Helicopter Game")
                .font(.largeTitle.bold())
                .foregroundColor(Color.white)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .opacity(0.8)
                        .cornerRadius(10)
                )
            Spacer()
            Image("Helicopter")
            
            NavigationLink(destination: ContentView()) {
                Text("Start")
                    .bold()
                    .frame(width: 280, height: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .background(Color.black)
    }
}
