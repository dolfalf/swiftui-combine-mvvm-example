//
//  ContentView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/03/25.
//

import SwiftUI

/*
 * Viewの実装は下記のリンクを参考に
 * https://qiita.com/YutoMizutani/items/026133035c36bf0652ba
 *
 */

struct ContentView: View {
    var body: some View {
        
        
//        WalkthroughView()
//        SignupView()
        LoginView()
        
//        TabView {
//            RateListView()
//                .tabItem {
//                    Image(systemName:"1.square.fill" )
//                }
//            ArticleListView()
//                .tabItem {
//                    Image(systemName: "2.square.fill")
//                }
//            FirstView()
//                .tabItem {
//                    Image(systemName: "3.square.fill")
//                }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
