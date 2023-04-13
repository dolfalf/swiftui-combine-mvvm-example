//
//  SampleListViewModel.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import SwiftUI
import Combine

final class SampleListViewModel: ObservableObject, UnidirectionalDataFlowType {
    typealias InputType = Input

    private var cancellables: [AnyCancellable] = []
    
    // MARK: Input
    enum Input {
        case onAppear
    }
    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    // MARK: Output
    @Published private(set) var samples: [Sample] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    
    private let responseSubject = PassthroughSubject<SampleResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private let trackingSubject = PassthroughSubject<TrackEventType, Never>()
    
    private let apiService: APIServiceType
    private let trackerService: TrackerType
    init(apiService: APIServiceType = APIService(),
         trackerService: TrackerType = TrackerService()) {
        self.apiService = apiService
        self.trackerService = trackerService
        
        bindInputs()
        bindOutputs()
    }
    
    private func bindInputs() {
        let request = SampleRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<SampleResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                }
        }
        
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)
        
        let trackingSubjectStream = trackingSubject
            .sink(receiveValue: trackerService.log)
        
        let trackingStream = onAppearSubject
            .map { .listView }
            .subscribe(trackingSubject)
        
        cancellables += [
            responseStream,
            trackingSubjectStream,
            trackingStream,
        ]
    }
    
    private func bindOutputs() {
        let sampleStream = responseSubject
            .map { $0.items }
            .assign(to: \.samples, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        cancellables += [
            sampleStream,
            errorStream,
            errorMessageStream
        ]
    }
}
