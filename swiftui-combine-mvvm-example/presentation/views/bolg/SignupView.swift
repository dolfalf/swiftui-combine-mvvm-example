//
//  SignupView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var nickname = ""
    @State private var selfIntroduction = ""
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image("signup-main")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.top, 40)
                    
                    HStack {
                        Text("サインアップ")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    SocialButtonGroupView(googleClickHandler: {
                        //
                    }, facebookClickHandler: {
                        //
                    }, twitterClickHandler: {
                        //
                    })
                    .padding(.bottom, 10)
                    
                    Text("メールアドレスで登録をご希望の方はこちらへ")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)
                    
                        VStack(alignment: .leading, spacing: 20) {
                            UnderlinedTextField(placeholder: "メールアドレス", icon: "mail", isSecure: false, text: $email)
                                .frame(height: 40)
                            
                            UnderlinedTextField(placeholder: "パスワード", icon: "lock.square", isSecure: true, text: $password)
                                .frame(height: 40)
                            
                            UnderlinedTextField(placeholder: "名前", icon: "person", isSecure: false, text: $nickname)
                                .frame(height: 40)
                            
                            UnderlinedTextField(placeholder: "自己紹介", icon: "square.and.pencil", isSecure: false, text: $selfIntroduction)
                                .frame(height: 40)
                        }
                        .padding(.horizontal, 16)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
