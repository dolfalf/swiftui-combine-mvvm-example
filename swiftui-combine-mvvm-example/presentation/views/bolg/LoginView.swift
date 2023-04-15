//
//  LoginView.swift
//  swiftui-combine-mvvm-example
//
//  Created by jaeeun on 2023/04/15.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 20) {
                    Image("login-main")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.top, 40)
                    
                    HStack {
                        Text("ログイン")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        UnderlinedTextField(placeholder: "メールアドレス", icon: "mail", isSecure: false, text: $email)
                            .frame(height: 40)
                        
                        UnderlinedTextField(placeholder: "パスワード", icon: "lock.square", isSecure: true, text: $password)
                            .frame(height: 40)
                    }
                    .padding(.horizontal, 16)
                    
                    Text("パスワードを忘れた方はこちらへ")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    Button {
                        //
                    } label: {
                        Text("ログイン")
                            .foregroundColor(.white)
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Capsule().fill(Color.blue))
                    }
                    
                    Text("ソーシャルアカウントでログインをされる方は、")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding()
                    
                    SocialButtonGroupView(googleClickHandler: {
                        //
                    }, facebookClickHandler: {
                        //
                    }, twitterClickHandler: {
                        //
                    })
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
