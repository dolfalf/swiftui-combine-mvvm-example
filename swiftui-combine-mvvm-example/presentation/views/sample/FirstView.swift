//
//  FirstView.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/04.
//

import SwiftUI

struct FirstView: View {
    @State private var isPresented = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                // 2. Navigation Push, Pop遷移
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail View")
                }
                // 3. Present遷移
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Present Modal View")
                }
                .sheet(isPresented: $isPresented, content: {
                    ModalView(isPresented: $isPresented)
                })
                // 4. Alert系遷移
                Button(action: {
                    showAlert.toggle()
                }) {
                    Text("Show Alert")
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Alert"),
                          message: Text("This is an alert."),
                          dismissButton: .default(Text("OK")))
                })
            }
            .navigationBarTitle("First View")
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
