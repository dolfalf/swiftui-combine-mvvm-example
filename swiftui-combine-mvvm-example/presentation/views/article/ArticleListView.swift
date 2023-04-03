//
//  ArticleListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct ArticleListView: View {
    @State var askRateItems = [CGFloat(10), CGFloat(21), CGFloat(12), CGFloat(23), CGFloat(14), CGFloat(28), CGFloat(10), CGFloat(21), CGFloat(12), CGFloat(23)]
    @State var bidRateItems = [CGFloat(32), CGFloat(11), CGFloat(32), CGFloat(23), CGFloat(34), CGFloat(30), CGFloat(10), CGFloat(21), CGFloat(12), CGFloat(23)]
    
    var body: some View {
        VStack {
            // 共通部品テスト
            Text("ArticleView")
                .padding()
                .background(Color.accentGreen)
                .foregroundColor(Color.mainColor)
                .rounded()
                .shadowed()
                .overlayWithBorder(2, color: Color.accentBlue)
            
            // UIView利用テスト
            UIChartRepresentable(askRateItems: $askRateItems,
                                 bidRateItems: $bidRateItems)
            .frame(width: 100, height: 100)
            .background(Color.gray)
        }
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
