//
//  ShadowModifier.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/26.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

extension View {
    func shadowed() -> some View {
        modifier(ShadowModifier())
    }
}

