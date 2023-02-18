//
//  URLRequestConstructor.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

// MARK: - URLRequestConstructor

struct URLRequestConstructor: RequestConstructor {
    static let kBaseScheme = "https"
    
    func urlRequest(from requestable: Requestable)-> URLRequest? {
        var components = URLComponents()
        
        components.scheme = Self.kBaseScheme
        components.host = requestable.host
        components.path = requestable.path
        components.queryItems = constructQueryItems(requestable.params)
        
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = requestable.timeoutInterval
        request.httpMethod = requestable.method.rawValue
        
        return request
    }
}

// MARK: - Private implementation

private extension URLRequestConstructor {
    func constructQueryItems(_ parameters: [String: Any]) -> [URLQueryItem]? {
        guard !parameters.isEmpty else {
            return nil
        }
        
        var queryItems = [URLQueryItem]()
        parameters.forEach { key, value in
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            queryItems.append(queryItem)
        }
        
        return queryItems
    }
}
