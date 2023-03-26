//
//  FontModifier.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/26.
//

import SwiftUI

struct Title1Font: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 24).bold())
    }
}

struct Title2Font: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 20).bold())
    }
}

struct Body1Font: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
    }
}

struct Body2Font: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
    }
}

struct CaptionFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 10))
    }
}

struct CustomFont: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}
