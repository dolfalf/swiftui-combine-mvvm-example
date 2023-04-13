//
//  UnidirectionalDataFlowType.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
