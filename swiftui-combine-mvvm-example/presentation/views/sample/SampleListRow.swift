//
//  SampleListRow.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import SwiftUI

struct SampleListRow: View {

    @State var sample: Sample

    var body: some View {
        NavigationLink(destination: SampleDetailView(viewModel: .init(sample: sample))) {
            Text(sample.fullName)
        }
    }
}

#if DEBUG
struct SampleListRow_Previews : PreviewProvider {
    static var previews: some View {
        SampleListRow(sample: Sample(id: 1,
                                     fullName: "foo",
                                     owner: User(id: 1, login: "bar", avatarUrl: URL(string: "baz")!)))
    }
}
#endif
