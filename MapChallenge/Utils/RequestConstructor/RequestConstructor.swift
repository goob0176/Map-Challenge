//
//  RequestConstructor.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

protocol RequestConstructor {
    func urlRequest(from requestable: Requestable)-> URLRequest?
}
