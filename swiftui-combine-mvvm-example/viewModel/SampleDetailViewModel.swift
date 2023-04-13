//
//  SampleDetailViewModel.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import SwiftUI
import Combine

final class SampleDetailViewModel: ObservableObject {
    let objectWillChange: AnyPublisher<SampleListViewModel, Never>
    let objectWillChangeSubject = PassthroughSubject<SampleListViewModel, Never>()
    
    let sample: Sample
    
    init(sample: Sample) {
        objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
        self.sample = sample
    }
}
