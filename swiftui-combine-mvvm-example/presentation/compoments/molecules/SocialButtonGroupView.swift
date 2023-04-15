//
//  SocialButtonGroupView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import SwiftUI

struct SocialButtonGroupView: View {
    
    let googleClickHandler: (() -> Void)?
    let facebookClickHandler: (() -> Void)?
    let twitterClickHandler: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 20) {
            IconButton(name: "google-icon") {
                googleClickHandler?()
            }
            IconButton(name: "facebook-icon") {
                facebookClickHandler?()
            }
            IconButton(name: "twitter-icon") {
                twitterClickHandler?()
            }
        }
    }
}

struct SocialButtonGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SocialButtonGroupView(googleClickHandler: nil,
                              facebookClickHandler: nil,
                              twitterClickHandler: nil)
    }
}
