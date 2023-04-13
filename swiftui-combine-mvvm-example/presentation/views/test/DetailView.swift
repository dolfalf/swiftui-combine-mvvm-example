//
//  DetailView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/04.
//

import SwiftUI

// 2. Navigation Push, Pop遷移
struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarTitle("Detail View", displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
