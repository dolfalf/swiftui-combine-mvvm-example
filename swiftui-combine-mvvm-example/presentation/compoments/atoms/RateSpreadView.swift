//
//  RateSpreadView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

struct RateSpreadView: View {
    var value: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text("スプレッド")
                .font(Font.system(size: 9))
                .foregroundColor(.primary)
            Text(value)
                .font(Font.system(size: 9))
                .foregroundColor(.primary)
        }
    }
}

struct RateSpreadView_Previews: PreviewProvider {
    static let view = RateSpreadView(value: "0.3")

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
