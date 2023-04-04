//
//  FXRateListView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/04.
//

import SwiftUI

struct CurrencyPair: Identifiable {
    let id = UUID()
    let baseCurrency: String
    let quoteCurrency: String
    let bid: Double
    let ask: Double
}

let sampleCurrencyPairs = [
    CurrencyPair(baseCurrency: "USD", quoteCurrency: "JPY", bid: 110.20, ask: 110.30),
    CurrencyPair(baseCurrency: "EUR", quoteCurrency: "USD", bid: 1.1045, ask: 1.1055),
    CurrencyPair(baseCurrency: "GBP", quoteCurrency: "USD", bid: 1.2945, ask: 1.2955),
    CurrencyPair(baseCurrency: "AUD", quoteCurrency: "USD", bid: 0.7245, ask: 0.7255),
    CurrencyPair(baseCurrency: "CAD", quoteCurrency: "USD", bid: 0.7845, ask: 0.7855),
]

struct FXRateListView: View {
    let currencyPairs: [CurrencyPair]

    var body: some View {
        NavigationView {
            List(currencyPairs) { currencyPair in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(currencyPair.baseCurrency)/\(currencyPair.quoteCurrency)")
                            .font(.headline)
                        HStack {
                            Text("Bid: \(currencyPair.bid, specifier: "%.4f")")
                            Text("Ask: \(currencyPair.ask, specifier: "%.4f")")
                        }
                        .font(.subheadline)
                    }
                    Spacer()
                    currencyIcon(for: currencyPair.baseCurrency)
                }
            }
            .navigationTitle("FX Rates")
        }
    }
    
    private func currencyIcon(for currency: String) -> some View {
        let iconName: String
        switch currency {
        case "USD":
            iconName = "dollarsign.circle"
        case "EUR":
            iconName = "eurosign.circle"
        case "JPY":
            iconName = "yensign.circle"
        case "GBP":
            iconName = "sterlingsign.circle"
        case "AUD", "CAD":
            iconName = "dollarsign.circle"
        default:
            iconName = "questionmark.circle"
        }
        return Image(systemName: iconName)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.blue)
    }
}

struct FXRateListView_Previews: PreviewProvider {
    static var previews: some View {
        FXRateListView(currencyPairs: sampleCurrencyPairs)
    }
}
