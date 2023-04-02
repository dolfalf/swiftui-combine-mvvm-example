//
//  RateBoardView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

struct RateBoardView: View {
    var body: some View {
        HStack(spacing: 32) {
            VStack(alignment: .trailing, spacing: 0) {
                RateTextView(digitLeading: "1", digitMiddle: "23", digitTailing: "45")
                RateSubTextView(symbol: "H", number: "1.234", tapHandler: nil)
                
            }
            VStack(alignment: .trailing,spacing: 0) {
                RateTextView(digitLeading: "1", digitMiddle: "56", digitTailing: "78")
                RateSubTextView(symbol: "L", number: "1.234", tapHandler: nil)
            }
        }
    }
}

struct RateBoardView_Previews: PreviewProvider {
    static let view = RateBoardView()

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .fixedSize()
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .fixedSize()
                .environment(\.colorScheme, .dark)
        }
    }
}
