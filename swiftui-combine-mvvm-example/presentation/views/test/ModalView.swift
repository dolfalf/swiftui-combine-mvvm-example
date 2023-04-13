//
//  ModalView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/04.
//

import SwiftUI

// 3. Present遷移
struct ModalView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Modal View")
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Dismiss")
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        ModalView(isPresented: $value)
    }
}
