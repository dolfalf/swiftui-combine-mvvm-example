//
//  SampleDetailView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import SwiftUI

struct SampleDetailView: View {
    @StateObject var viewModel: SampleDetailViewModel
    
    var body: some View {
        Text(viewModel.sample.fullName)
    }
}

#if DEBUG
struct SampleDetailView_Previews : PreviewProvider {
    static var previews: some View {
        SampleDetailView(viewModel: .init(sample: Sample(id: 1,
                                                         fullName: "foo",
                                                         owner: User(id: 1, login: "bar", avatarUrl: URL(string: "http://baz.com")!))
            )
        )
    }
}
#endif
