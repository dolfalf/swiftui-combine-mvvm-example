//
//  UIChartRepresentable.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/02.
//

import SwiftUI
import UIKit

/// RateCellへ表示される
struct UIChartRepresentable: UIViewRepresentable {
    @Binding var value: Float
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIView {
        // FIXME: これをChartViewにする
        let chartView = UIView()
        return chartView
        
//        let slider = UISlider()
//        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
//        return slider
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // FIXME: chartViewにあるステータスpropertyを更新
        // uiView.value = value
    }

    class Coordinator: NSObject {
        var parent: UIChartRepresentable

        init(_ parent: UIChartRepresentable) {
            self.parent = parent
        }

//        @objc func valueChanged(_ sender: UISlider) {
//            parent.value = sender.value
//        }
    }
}

// 使い方
// UIChartRepresentable(value: $chartValue).padding()
