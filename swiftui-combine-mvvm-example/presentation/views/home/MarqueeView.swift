//
//  MarqueeView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/09.
//

import SwiftUI

struct StockModel {
    let name: String
    let code: String
    let price: String
    let ratio: String
}

struct MarqueeView: View {
    
    @State private var scrollOffset: CGFloat = 0
    let duration: CGFloat
    
        let items = [StockModel(name: "tesla", code: "TSLA", price: "¥345,500", ratio: "(+0.15%))"),
                     StockModel(name: "amazon", code: "AMZN", price: "¥245,500", ratio: "(-0.15%))"),
                     StockModel(name: "apple", code: "APPL", price: "¥1,245,500", ratio: "(-0.15%))"),
                     StockModel(name: "nvidia", code: "NVIA", price: "¥45,500", ratio: "(+7.15%))")]
    
        var body: some View {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<2) { _ in
                            ForEach(items, id: \.name) { item in
                                BoardItem(name: item.name, code: item.code, price: item.price, ratio: item.ratio)
                            }
                        }
                    }
                    .frame(height: geometry.size.height)
                    .offset(x: scrollOffset)
                    .onAppear {
                        startAutoScroll(viewWidth: geometry.size.width)
                    }
                    .animation(.linear(duration: duration), value: scrollOffset)
                }
            }
        }
        
        func startAutoScroll(viewWidth: CGFloat) {
            let totalWidth = viewWidth * CGFloat(items.count) // 要素の総幅を計算
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                scrollOffset -= 1 // 1ポイントずつスクロール
                if abs(scrollOffset) >= totalWidth {
                    scrollOffset = 0 // スクロール位置を初期位置に戻す
                }
            }
        }
}

struct BoardItem: View {
    let name: String
    let code: String
    let price: String
    let ratio: String
    
    var body: some View {
        HStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 24, height: 24)
                .foregroundColor(.red)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(code)
                    .font(.caption)
                    .foregroundColor(.black)
                 HStack {
                    Text(price)
                        .font(.caption2)
                        .foregroundColor(.primary)
                    Text(ratio)
                        .font(.system(size: 8))
                        .foregroundColor(ratio.prefix(2) == "+" ? .green : .red)
                }
            }
        }
    }
}


