//
//  PageView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/14.
//

import SwiftUI

struct PageView: View {
    @State var currentPageIndex : Int = 0
        
        var body: some View {
            VStack {
                ZStack {
                    if currentPageIndex == 0 {
                        Image(systemName: "1.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                        
                        
                    } else if currentPageIndex == 1 {
                        Image(systemName: "2.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                        
                        
                    } else {
                        Image(systemName: "3.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                    }
                    
                }
                
                PageControl(currentPageIndex: $currentPageIndex, numberOfPages: 3, tintColor: .gray)
                
                HStack {
                    Button {
                        if currentPageIndex != 0 {
                            currentPageIndex = currentPageIndex - 1
                        }
                    } label: {
                        Text("Previous")
                        
                    }
                    .buttonStyle(.borderless)
                    .padding()
                    
                    Button {
                        if currentPageIndex < 3 {
                            currentPageIndex = currentPageIndex + 1
                        }
                    } label: {
                        Text("Next")
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                
            }
            .animation(.spring())
            .padding()
        }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
