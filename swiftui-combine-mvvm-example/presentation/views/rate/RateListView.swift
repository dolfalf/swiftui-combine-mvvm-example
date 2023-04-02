//
//  RateListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

struct RateListView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                RateCellView()
            }
            .navigationTitle("Rate List")
        }
        .listStyle(.plain)
//        List {
//            ForEach() {
//                RateCellView()
//            }
//        }
    }
}

struct RateListView_Previews: PreviewProvider {
    static var previews: some View {
        RateListView()
    }
}
