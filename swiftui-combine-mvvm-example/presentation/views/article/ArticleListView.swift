//
//  ArticleListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct ArticleListView: View {
    var body: some View {
        Text("ArticleView")
            .padding()
            .background(Color.accentGreen)
            .foregroundColor(Color.mainColor)
            .rounded()
            .shadowed()
            .overlayWithBorder(2, color: Color.accentBlue)
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
