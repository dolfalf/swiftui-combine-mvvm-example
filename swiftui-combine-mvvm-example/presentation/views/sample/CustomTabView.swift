//
//  CustomTabView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/14.
//

import SwiftUI

struct CustomTabView: View {
    
    // タブの選択値と初期値.
    @State private var selected: TabItem = .piyo
    
    var body: some View {
        
        ZStack {
            
            // 背景色.
            Color("main").ignoresSafeArea()
            
            // メイン画面部分はTabViewで定義.
            TabView(selection: $selected) {
                Tab1View()
                    .tag(TabItem.piyo)
                Tab2View()
                    .tag(TabItem.pen)
                Tab3View()
                    .tag(TabItem.neko)
                Tab4View()
                    .tag(TabItem.tobipen)
            }
            // PageTabスタイルを利用する(インジケータは非表示).
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack {
                
                Spacer(minLength: 0)
                
                // タブビュー部分.
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { tabItem in
                        TabItemView(tabItem: tabItem, selected: $selected)
                    }
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(Color.white.clipShape(Capsule()))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: 5)
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
        Group {
            TabItemView(tabItem: .piyo, selected: .constant(.piyo))
            TabItemView(tabItem: .pen, selected: .constant(.piyo))
        }
        .previewLayout(.fixed(width: 200, height: 200))
    }
}

enum TabItem: String, CaseIterable {
    case piyo
    case pen
    case neko
    case tobipen
    
    var name: String {
        switch self {
        case .piyo:
            return "1.square.fill"
        case .pen:
            return "2.square.fill"
        case .neko:
            return "3.square.fill"
        case .tobipen:
            return "4.square.fill"
        }
    }
}

struct TabItemView: View {
    
    let tabItem: TabItem
    @Binding var selected: TabItem
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: tabItem.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // 選択状態によって、サイズや間隔を調整する.
                .frame(width: tabItem == selected ? 30 : 24)
                .padding(.vertical, 0)
                .padding(.horizontal, 16)
                .offset(y: tabItem == selected ? -4 : 0)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = tabItem // タップしたら自身をselectedに.
                    }
                }
            
            Text("test").font(.system(size: 12))
        }
        
    }
}


// MARK: - ダミーの画面たち
struct Tab1View: View {
    var body: some View {
        Text("Tab1")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.red)
    }
}

struct Tab2View: View {
    var body: some View {
        Text("Tab2")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.green)
    }
}

struct Tab3View: View {
    var body: some View {
        Text("Tab3")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.blue)
    }
}

struct Tab4View: View {
    var body: some View {
        Text("Tab4")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.yellow)
    }
}
