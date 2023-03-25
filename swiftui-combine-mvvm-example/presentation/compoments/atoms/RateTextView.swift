//
//  RateTextView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct RateTextView: View {
    
    var digitLeading: String
    var digitMiddle: String
    var digitTailing: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Text(digitLeading)
                .font(Font.system(size: 12))
            Text(digitMiddle)
                .font(Font.system(size: 20))
            Text(digitTailing)
                .font(Font.system(size: 12))
        }
        .background(.green)
    }
}

struct RateTextView_Previews: PreviewProvider {
    static let view = RateTextView(digitLeading: "123", digitMiddle: "45", digitTailing: "6")
    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
        }
    }
}
