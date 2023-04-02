//
//  RateInfoRowView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

struct RateInfoRowView: View {
    var body: some View {
        HStack(spacing: 4) {
            RateCurrencyView(value: "USDJPY")
                .fixedSize()
            VStack(spacing: 4) {
                RateSpreadView(value: "0.2")
                RateBeforeDayView(value: "1.234", arrowDirection: .down)
            }
        }
    }
}

struct RateInfoRowView_Previews: PreviewProvider {
    static let view = RateInfoRowView()

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
