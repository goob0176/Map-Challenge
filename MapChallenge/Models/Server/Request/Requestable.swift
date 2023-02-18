//
//  Requestable.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

enum Method: String {
    case get = "GET"
}

protocol Requestable {
    var host: String { get }
    var path: String { get }
    var params: [String: Any] { get }
    var timeoutInterval: TimeInterval { get }
    var method: Method { get }
}
