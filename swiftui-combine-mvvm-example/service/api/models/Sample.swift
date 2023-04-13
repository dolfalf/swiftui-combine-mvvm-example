//
//  Sample.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import SwiftUI

struct Sample: Decodable, Hashable, Identifiable {
    var id: Int64
    var fullName: String
    var description: String?
    var stargazersCount: Int = 0
    var language: String?
    var owner: User
}
