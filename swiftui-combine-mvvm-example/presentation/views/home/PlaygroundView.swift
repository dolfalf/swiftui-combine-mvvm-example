//
//  PlaygroundView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/10.
//

import SwiftUI

struct PlaygroundView: View {
    @State private var progress: CGFloat = 0.5
    
    var body: some View {
        VStack {
            
            VStack {
                BoardView(text: "あいうえお")
            }
            .padding(.horizontal, 20)
            .frame(height: 60)
            .background(Color.gray)
            .clipped()
            
            HStack {
                Text("Hello, SwiftUI!")
                            .foregroundColor(.white)
                            .padding()
                            .background(Capsule().fill(Color.red))
                
                Text("Hello, SwiftUI!")
                            .padding()
                            .background(Capsule().stroke(Color.red, lineWidth: 3))
            }
            
            Text("Progress: \(Int(progress * 100))%")
            
            Capsule()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 20)
                .overlay(
                    Capsule()
                        .fill(Color.red)
                        .frame(width: UIScreen.main.bounds.width * progress, height: 20)
                        .padding(.leading, -UIScreen.main.bounds.width * (1 - progress) / 2)
                )
        }
        .padding()
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}

struct BoardView: View {
    
    @State private var animationAmount: CGFloat = 2.0
    let text: String

    var body: some View {
        GeometryReader { geometry in
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .position(x: (geometry.size.width / 2) + (animationAmount * geometry.size.width), y: geometry.size.height / 2)
                .onAppear {
                    withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                        animationAmount = -1.0
                    }
                }
        }
    }
}
