//
//  RoundedModifier.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/26.
//

import SwiftUI

struct RoundedModifier: ViewModifier {
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius)
    }
}

extension View {
    func rounded(cornerRadius: CGFloat = 8) -> some View {
        modifier(RoundedModifier(cornerRadius: cornerRadius))
    }
}
