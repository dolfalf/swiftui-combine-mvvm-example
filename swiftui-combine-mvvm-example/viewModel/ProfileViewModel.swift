//
//  ProfileViewModel.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    @Published var isNameValid: Bool = true
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(profile: Profile) {
        self.profile = profile
        
        // TextFieldから入力される名前のバリデーションを行う
        $profile
            .map { self.validateName($0.name) }
            .assign(to: \.isNameValid, on: self)
            .store(in: &cancellables)
    }
    
    private func validateName(_ name: String) -> Bool {
        return !name.isEmpty
    }
}
