//
//  RegistrationViewModel.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import Combine
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var member: Member
    @Published var isNameValid: Bool = false
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(member: Member) {
        self.member = member
        
        // Validate name
        $member
            .map { self.validateName($0.name) }
            .assign(to: \.isNameValid, on: self)
            .store(in: &cancellables)
        
        // Validate email
        $member
            .map { self.validateEmail($0.email) }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
        
        // Validate password
        $member
            .map { self.validatePassword($0.password) }
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
    }
    
    private func validateName(_ name: String) -> Bool {
        return !name.isEmpty
    }
    
    private func validateEmail(_ email: String) -> Bool {
        // A simple email validation
        return email.contains("@") && email.contains(".")
    }
    
    private func validatePassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    var isFormValid: Bool {
        return isNameValid && isEmailValid && isPasswordValid
    }
}
