//
//  NetworkService.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct NetworkService: DataService {
    private static let kSuccessStatusCode = 200
    
    private let requestConstructor: RequestConstructor
    
    init(
        requestConstructor: RequestConstructor = URLRequestConstructor()
    ) {
        self.requestConstructor = requestConstructor
    }
    
    func handle<T: Decodable>(request: Requestable, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let request = requestConstructor.urlRequest(from: request) else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard error == nil else {
                completion(.failure(NetworkError.dataReceivingError(description: error?.localizedDescription ?? "")))
                return
            }
            guard let data = data,
                      let httpResponse = urlResponse as? HTTPURLResponse,
                      httpResponse.statusCode == Self.kSuccessStatusCode else {
                          completion(.failure(NetworkError.serverError))
                          return
                      }
            do {
                let response = try JSONDecoder().decode(responseType, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(NetworkError.dataReceivingError(description: error.localizedDescription)))
            }
        }
        .resume()
    }
}
