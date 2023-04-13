//
//  SampleListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import SwiftUI

struct SampleListView : View {
    @StateObject var viewModel: SampleListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.samples) { sample in
                SampleListRow(sample: sample)
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .navigationBarTitle(Text("Samples"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

#if DEBUG
struct SampleListView_Previews : PreviewProvider {
    static var previews: some View {
        SampleListView(viewModel: .init())
    }
}
#endif
