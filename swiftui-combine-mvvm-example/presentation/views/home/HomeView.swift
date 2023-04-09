//
//  HomeView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/09.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            HomeAppBar()
            
            DepositView()
            
            ButtonGroupView()
            
            CategoryTitleView(title: "トレンド")

            MarqueeView(duration: 20)
                .frame(height: 40)
            
            CategoryTitleView(title: "カテゴリー")
            
            let tags = ["保有中の銘柄", "人気種目", "急上昇", "トップ５", "取引量", "株総額"]
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 8) {
                    ForEach(tags, id: \.self) { tag in
                        TagView(text: tag)
                    }
                }
                .padding()
            }
            .frame(height: 20)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    StockItem(name: "apple",
                              stockName: "アップル",
                              stockDecription: "Apple Inc.",
                              price: "¥15,232,000",
                              ratio: "+1.05%")
                    
                    StockItem(name: "nvidia",
                              stockName: "エヌビディア",
                              stockDecription: "nVidia Inc.",
                              price: "¥3,232,000",
                              ratio: "+7.05%")
                    StockItem(name: "tesla",
                              stockName: "テスラ",
                              stockDecription: " Tesla Inc.",
                              price: "¥332,232,000",
                              ratio: "+6.05%")
                    
                    StockItem(name: "amazon",
                              stockName: "アマゾン",
                              stockDecription: " Amazon Inc.",
                              price: "¥232,300",
                              ratio: "-0.05%")
                    
                    StockItem(name: "microsoft",
                              stockName: "マイクロソフト",
                              stockDecription: " Microsoft Inc.",
                              price: "¥432,300",
                              ratio: "+8.05%")
                }
            }
            
            
            Spacer()
        }
    }
}

struct StockItem: View {
    let name: String
    let stockName: String
    let stockDecription: String
    
    let price: String
    let ratio: String
    
    var body: some View {
        HStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(stockName)
                    .font(.caption)
                Text(stockDecription)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(price)
                    .font(.caption)
                    .bold()
                Text(ratio)
                    .font(.caption2)
                    .bold()
                    .foregroundColor(ratio.prefix(1) == "+" ? .green : .red)
                
            }
        }
        .padding(.horizontal, 20)
        
        Divider().padding(.horizontal, 20)
    }
}

struct TagView: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                
            Text(text)
                .font(.caption)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .foregroundColor(.black)
        }
    }
}

struct CategoryTitleView: View {
    let title: String
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.body)
                .bold()
            Spacer()
            Text("全て見る")
                .font(. caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 20)
    }
}

struct ButtonGroupView: View {
    var body: some View {
        
        HStack {
            HStack(alignment: .center) {
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text("出金")
                    .font(.body)
                    .bold()
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            Spacer()

            HStack(alignment: .center) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text("入金")
                    .font(.body)
                    .bold()
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
        .padding(.horizontal, 20)
    }
}

struct DepositView: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.blue
                .frame(height: 120)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("総投資額")
                    .font(.body)
                    .foregroundColor(.white)
                Text("¥14,209,204")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("¥30,340(+15%)")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(.leading, 20)
            .lineSpacing(8)
        }
        .padding(.horizontal, 20)
    }
}

struct HomeAppBar: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.red)
                    .offset(x: 12)
                Image(systemName: "mail")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 20)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
