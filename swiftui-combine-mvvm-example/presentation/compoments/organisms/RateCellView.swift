//
//  RateCellView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

struct RateCellView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            HStack(spacing: 4) {
                RateInfoRowView()
                Spacer()
            }
            HStack(alignment: .center, spacing: 4) {
                Spacer()
                RateBoardView()
                // Chart
                Spacer()
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 60, height: 60)
            }
        }
    }
}

struct RateCellView_Previews: PreviewProvider {
    static let view = RateCellView()

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
