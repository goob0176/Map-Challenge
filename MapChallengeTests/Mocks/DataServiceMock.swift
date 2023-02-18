//
//  DataServiceMock.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
@testable import MapChallenge

private struct Paths {
    static let geocoding = "/geo/1.0/direct"
    static let weather = "/data/2.5/weather"
}

struct DataServiceMock: DataService {
    let shouldFail: Bool
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func handle<T: Decodable>(
        request: MapChallenge.Requestable,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void) {
            guard !shouldFail else {
                completion(.failure(NetworkError.serverError))
                return
            }
            
            switch request.path {
            case Paths.geocoding:
                completion(.success(formMockResponse(of: responseType, from: MocksDictionariesFactory.geolocationsArray)))
            case Paths.weather:
                completion(.success(formMockResponse(of: responseType, from: MocksDictionariesFactory.placeWeatherModel)))
            default:
                completion(.failure(NetworkError.serverError))
            }
        }
    
    private func formMockResponse<T: Decodable>(of type: T.Type, from string: String) -> T {
        let mockData = string.data(using: .utf8)!
        let response = try! JSONDecoder().decode(type, from: mockData)
        
        return response
    }
}
