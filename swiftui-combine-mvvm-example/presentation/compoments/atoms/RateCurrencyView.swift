//
//  RateCurrencyView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

struct RateCurrencyView: View {
    
    var value: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(value)
            Text(value)
                .font(Font.system(size: 9))
                .foregroundColor(.primary)
        }
    }
}

struct RateCurrencyView_Previews: PreviewProvider {
    static let view = RateCurrencyView(value: "USDJPY")

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
