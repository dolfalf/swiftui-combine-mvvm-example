//
//  APIService.swift
//  swiftui-combine-mvvm-example
//
//  Created by P1714 on 2023/04/12.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

// MARK: -
final class APIService: APIServiceType {
    
    private let baseURL: URL
    
    init(baseURL: URL = URL(string: "https://api.xxxxxxx.com")!) {
        self.baseURL = baseURL
    }

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
    
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var urlRequest = URLRequest(url: urlComponents.url!)
        
        // Apply the HTTP method from the request
        urlRequest.httpMethod = request.method.rawValue
        
        // Apply the request body if it exists
        if let body = request.body {
            urlRequest.httpBody = body
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
