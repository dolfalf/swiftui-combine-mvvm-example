//
//  AnySubscription.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import Combine

final class AnySubscription: Subscription {
    
    private let cancellable: AnyCancellable
    
    init(_ cancel: @escaping () -> Void) {
        self.cancellable = AnyCancellable(cancel)
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        cancellable.cancel()
    }
}
