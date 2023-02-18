//
//  NetworkRequest.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct NetworkRequest: Requestable {
    let host: String
    let path: String
    let params: [String: Any]
    let timeoutInterval: TimeInterval
    let method: Method
}
