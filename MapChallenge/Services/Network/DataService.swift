//
//  DataService.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

protocol DataService {
    func handle<T: Decodable>(request: Requestable, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
