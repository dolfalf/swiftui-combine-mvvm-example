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
    @Binding var askRateItems: [CGFloat]
    @Binding var bidRateItems: [CGFloat]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> TickChartView {
        // FIXME: これをChartViewにする
        let chartView = TickChartView()
        // NOTE: タッチイベントなどここで書く。addTarget...
        return chartView
    }

    func updateUIView(_ uiView: TickChartView, context: Context) {
        uiView.askRateItems = askRateItems
        uiView.bidRateItems = bidRateItems
    }

    class Coordinator: NSObject {
        var parent: UIChartRepresentable

        init(_ parent: UIChartRepresentable) {
            self.parent = parent
        }

//        // NOTE: callback methodなど
//        @objc func valueChanged(_ sender: UIButton) {
//            parent.value = sender.value
//        }
    }
}

// MARK: TickChartView
class TickChartView: UIView {

    var askRateItems = [CGFloat]()
    var bidRateItems = [CGFloat]()
    
    private let xAxisPointsCount = 10

    private let askLayer = CAShapeLayer()
    private let bidLayer = CAShapeLayer()
    
    // MARK: Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .clear
        initLine()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        // Tick Chart Ask
        if askRateItems.count > 0 {

            let tickLineAsk = UIBezierPath()
            let startPointAsk = getStartIndex(array: askRateItems)

            tickLineAsk.move(to: CGPoint(x: getXPoint(index: startPointAsk), y: getYPoint(yOrigin: askRateItems[0])))

            for (index, askRate) in askRateItems.enumerated() {
                let nextPoint = CGPoint(x: getXPoint(index: index + startPointAsk),
                                        y: getYPoint(yOrigin: askRate))
                tickLineAsk.addLine(to: nextPoint)
            }
            tickLineAsk.stroke()
            askLayer.path = tickLineAsk.cgPath
        }

        // Tick Chart Bid

        if bidRateItems.count > 0 {
            let tickLineBid = UIBezierPath()
            let startPointBid = getStartIndex(array: bidRateItems)

            tickLineBid.move(to: CGPoint(x: getXPoint(index: startPointBid), y: getYPoint(yOrigin: bidRateItems[0])))

            for (index, bidRate) in bidRateItems.enumerated() {
                let nextPoint = CGPoint(x: getXPoint(index: index + startPointBid),
                                        y: getYPoint(yOrigin: bidRate))
                tickLineBid.addLine(to: nextPoint)
            }
            tickLineBid.stroke()
            bidLayer.path = tickLineBid.cgPath
        }
    }

    // MARK: public methods
    func setCacheData(bid: [CGFloat], ask: [CGFloat]) {
        bidRateItems = bid
        askRateItems = ask
        setNeedsDisplay()
    }

    // MARK: private methods
    private func initLine() {
        askLayer.strokeColor = UIColor.blue.cgColor
        askLayer.fillColor = UIColor.clear.cgColor
        askLayer.lineWidth = 1.0
        self.layer.addSublayer(askLayer)

        bidLayer.strokeColor = UIColor.red.cgColor
        bidLayer.fillColor = UIColor.clear.cgColor
        bidLayer.lineWidth = 1.0
        self.layer.addSublayer(bidLayer)
    }
}

// MARK: チャートの計算に関するメソッド
extension TickChartView {

    private var combinedRateArray: [CGFloat] {
        return askRateItems + bidRateItems
    }

    // Bid/Askを合わせたレートの中で最大値
    private var yAxisMax: CGFloat {
        return combinedRateArray.max() ?? 0
    }

    // Bid/Askを合わせたレートの中で最小値
    private var yAxisMin: CGFloat {
        return combinedRateArray.min() ?? 0
    }

    // 最大値 - 最小値
    private var yAxisDiff: CGFloat {
        return yAxisMax - yAxisMin
    }

    // X軸の点と点の幅
    private var xAxisMargin: CGFloat {
        return self.frame.width / CGFloat(xAxisPointsCount - 1)
    }

    // 始点のIndexを計算する
    private func getStartIndex(array: [CGFloat]) -> Int {
        return  xAxisPointsCount - array.count
    }

    // indexからX座標を取る
    private func getXPoint(index: Int) -> CGFloat {
        return CGFloat(index) * xAxisMargin
    }

    // 値からY座標を取る
    private func getYPoint(yOrigin: CGFloat) -> CGFloat {
        let multiplier = self.frame.height / (yAxisMax - yAxisMin)
        let diff = yOrigin - yAxisMin
        // Y座標の反転処理
        return self.frame.height - diff * multiplier
    }
}
