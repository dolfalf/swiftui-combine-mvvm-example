//
//  RegistrationView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Name", text: $viewModel.member.name)
                .padding()
                .border(viewModel.isNameValid ? Color.gray : Color.red)
            
            TextField("Email", text: $viewModel.member.email)
                .padding()
                .border(viewModel.isEmailValid ? Color.gray : Color.red)
            
            SecureField("Password", text: $viewModel.member.password)
                .padding()
                .border(viewModel.isPasswordValid ? Color.gray : Color.red)
            
            Button(action: {
                // Handle registration logic
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .disabled(!viewModel.isFormValid)
        }
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel(member: Member(name: "", email: "", password: "")))
    }   
}
