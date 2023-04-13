//
//  TrackerService.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/13.
//

import Foundation

enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class TrackerService: TrackerType {
    
    func log(type: TrackEventType) {
        // do something
    }
}
