//
//  User.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import SwiftUI

struct User: Decodable, Hashable, Identifiable {
    var id: Int64
    var login: String
    var avatarUrl: URL
}
