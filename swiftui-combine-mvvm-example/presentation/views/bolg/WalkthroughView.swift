//
//  WalkthroughView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import SwiftUI

struct WalkthroughContent: Identifiable {
    var id = UUID()
    let name: String
    let slogan: String
    let description: String
}

struct WalkthroughView: View {
    @State var currentPage : Int = 0
    
    let contents = [
        WalkthroughContent(name: "walkthrough01",
                           slogan: "みんなで支え合う、家族のためのコミュニティ",
                           description: "障害を持つ家族をサポートや経験を通じて互いに助け合い、支え合うことができます。"),
        WalkthroughContent(name: "walkthrough02",
                           slogan: "つながりで強く、情報で支える",
                           description: "つながりを大切にし、有益な情報や経験を共有することは障害を持つ家族を強く支えます。"),
        WalkthroughContent(name: "walkthrough03",
                           slogan: "絆を深める、情報とつながりのツール",
                           description: "障害を持つ家族が情報や経験を共有し、互いにつながることで家族間の絆を深めるためのツールです。")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("main")
                .ignoresSafeArea()

            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<3) { index in
                        WalkthroughContentView(contents[currentPage])
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                PageControl(currentPageIndex: $currentPage,
                            numberOfPages: 3,
                            tintColor: .blue)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct WalkthroughContentView: View {
    
    var content: WalkthroughContent
    
    init(_ content: WalkthroughContent) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 64) {
            Image(content.name)
                .resizable()
                .scaledToFit()
                .frame(height: 240)
            
            VStack(spacing: 16) {
                Text(content.slogan)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                Text(content.description)
                    .font(.body)
                    .foregroundColor(.primary.opacity(0.5))
            }
            
        }
    }
}

struct Walkthrough_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}
