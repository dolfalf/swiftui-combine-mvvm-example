//
//  SampleRequest.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation

struct SampleRequest: APIRequestType {
    typealias Response = SampleResponse
    
    var method: HTTPMethod
    var path: String { return "/api/samples" }
    
    // GET形式場合パラメータはここで指定
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "key1", value: "value1"),
            .init(name: "key2", value: "value2")
        ]
    }
    
    // POST形式の場合パラメータはここで指定
    var body: Data? {
        switch method {
        case .post:
            // パラメータ定義
            let postData = ["key": "value"]
            return try? JSONSerialization.data(withJSONObject: postData, options: [])
        default:
            return nil
        }
    }
    
    init(method: HTTPMethod = .post) {
        self.method = method
    }
}
