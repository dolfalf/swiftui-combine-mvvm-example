//
//  RateSubTextView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct RateSubTextView: View {
    
    var symbol: String
    var number: String
    var tapHandler: (() -> Void)?
    
    init(symbol: String, number: String, tapHandler: (() -> Void)?) {
        self.symbol = symbol
        self.number = number
        self.tapHandler = tapHandler
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            Text(symbol)
                .foregroundColor(.red)
                .font(Font.system(size: 12))
            Text(number)
                .foregroundColor(.black)
                .font(Font.system(size: 12))
        }
        .background(.yellow)
        .onTapGesture {
            tapHandler?()
        }
    }
}

struct RateSubTextView_Previews: PreviewProvider {
    
    static let view = RateSubTextView(symbol: "H", number: "123.456") {
        //TODO:
    }
    
    static var previews: some View {
        Group {
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            view.previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
        }
    }
}
