//
//  APIServiceError.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
