    //
//  RateBeforeDayView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI

enum ArrowDirection: String {
    case none
    case up
    case down
}

struct RateBeforeDayView: View {
    var value: String
    var arrowDirection: ArrowDirection
    
    var body: some View {
        HStack(spacing: 0) {
            Text("前日比")
                .font(Font.system(size: 9))
                .foregroundColor(.primary)
            if arrowDirection == .none {
                Rectangle()
            } else {
                Image("icon-arrow-\(arrowDirection.rawValue)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
            }
            
            Text(value)
                .font(Font.system(size: 9))
                .foregroundColor(.primary)
        }
    }
}

struct RateBeforeDayView_Previews: PreviewProvider {
    static let view = RateBeforeDayView(value: "1.234", arrowDirection: .up)

    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
