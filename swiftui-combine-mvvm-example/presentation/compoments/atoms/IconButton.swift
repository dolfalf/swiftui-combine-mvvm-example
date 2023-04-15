//
//  IconButton.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import SwiftUI

struct IconButton: View {
    let name: String
    let clickHandler: (() -> Void)?
    
    var body: some View {
        Button(action: {
            clickHandler?()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .frame(height: 48)
                
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                        .frame(width: 24, height:24)
                        .clipShape(Circle())
                }
            }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(name: "google-icon") {
            //
        }
    }
}
