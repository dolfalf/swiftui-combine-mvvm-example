//
//  PageControl.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/14.
//

import UIKit
import SwiftUI

struct PageControl : UIViewRepresentable {
    
    @Binding var currentPageIndex: Int
    var numberOfPages : Int = 0
    var tintColor: Color?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// Create UIView object and configure the initial state
    /// - Returns: UIPageControl
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.numberOfPages = numberOfPages
        pageControl.tintColor = tintColor?.toUIColor()
        pageControl.addTarget(context.coordinator,
                              action: #selector(Coordinator.updateCurrentPage(sender:)),
                              for: .valueChanged)
        
        return pageControl
    }
    
    /// Update the state of UIKit view based on new info given from SwiftUI
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
        uiView.tintColor = tintColor?.toUIColor()
    }
    
    class Coordinator: NSObject {
            var pageControl: PageControl

            init(_ pageControl: PageControl) {
                self.pageControl = pageControl
            }

            @objc func updateCurrentPage(sender: UIPageControl) {
                pageControl.currentPageIndex = sender.currentPage
            }
        }
}
                                   

extension Color {
    func toUIColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.red, green: components.green, blue: components.blue, alpha: components.opacity)
    }
    
    private func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) = (0, 0, 0, 0)
        
        if scanner.scanHexInt64(&hexNumber) {
            let r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            let g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            let b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            let a = CGFloat(hexNumber & 0x000000ff) / 255
            colorComponents = (r, g, b, a)
        }
        
        return colorComponents
    }
}
