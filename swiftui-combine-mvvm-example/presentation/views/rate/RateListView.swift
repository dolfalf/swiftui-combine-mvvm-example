//
//  RateListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct RateListView: View {
    var body: some View {
        ZStack {
            Color.subColor

            VStack {
                // 共通部品テスト
                Text("RateView")
                    .padding()
                    .background(Color.accentGreen)
                    .foregroundColor(Color.mainColor)
                    .rounded()
                    .shadowed()
                    .overlayWithBorder(2, color: Color.accentBlue)
            }
        }
    }
}

struct RateListView_Previews: PreviewProvider {
    static var previews: some View {
        RateListView()
    }
}
