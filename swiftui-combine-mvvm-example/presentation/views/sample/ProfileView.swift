//
//  ProfileView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.profile.name)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.isNameValid ? Color.gray : Color.red, lineWidth: 1)
                )
            
            if !viewModel.isNameValid {
                Text("Name is required.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: Profile(name: "")))
    }
}
