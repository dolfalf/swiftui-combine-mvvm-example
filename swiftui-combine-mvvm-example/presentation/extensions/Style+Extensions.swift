//
//  Style+Extensions.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/26.
//

import SwiftUI

// MARK: - Font Style
extension View {
    func title1Font() -> some View {
        modifier(Title1Font())
    }
    
    func title2Font() -> some View {
        modifier(Title2Font())
    }
    
    func body1Font() -> some View {
        modifier(Body1Font())
    }
    
    func body2Font() -> some View {
        modifier(Body2Font())
    }
    
    func captionFont() -> some View {
        modifier(CaptionFont())
    }
    
    func customFont(size: CGFloat) -> some View {
        modifier(CustomFont(size: size))
    }
}

// MARK: - Color Style
extension Color {
    static let mainColor = Color("main")            /// 背景色など
    static let subColor = Color("sub")              /// ボーダーライン
    static let primaryColor = Color("primary")      /// テキスト色
    static let secondary = Color("secondary")       /// テキスト色
    
    static let accentGreen = Color("accentGreen")
    static let accentRed = Color("accentRed")
    static let accentBlue = Color("accentBlue")
}

// MARK: - Button Style
extension View {
    func overlayWithBorder(_ width: CGFloat, color: Color) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(color, lineWidth: width)
        )
    }
    
    func clipToCircle() -> some View {
        self.clipShape(Circle())
    }
}
