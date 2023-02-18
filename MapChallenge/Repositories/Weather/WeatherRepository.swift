//
//  WeatherRepository.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

// MARK: - Typealiases

private typealias GeolocationResponse = (Result<GeocodingLocationModel, NetworkError>)->Void

// MARK: - WeatherRepository

struct WeatherRepository: WeatherRepositoryType {
    private let dataService: DataService
    
    init(
        dataService: DataService = NetworkService()
    ) {
        self.dataService = dataService
    }
    
    func fetchWeather(for title: String, completion: @escaping WeatherResponse) {
        fetchPlace(title) { result in
            switch result {
            case .success(let model):
                weather(for: model, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Private implementation

private extension WeatherRepository {
    func fetchPlace(_ title: String, completion: @escaping GeolocationResponse) {
        dataService.handle(
            request: RequestsFactory.geocodingRequest(title),
            responseType: [GeocodingLocationModel].self,
            completion: { result in
                switch result {
                case .success(let models):
                    guard let model = models.first else {
                        completion(.failure(NetworkError.serverError))
                        return
                    }
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    func weather(for model: GeocodingLocationModel, completion: @escaping WeatherResponse) {
        guard let lat = model.lat,
              let lon = model.lon else {
            return
        }
        dataService.handle(
            request: RequestsFactory.placeRequest(latitude: lat, longitude: lon),
            responseType: PlaceWeatherModel.self
        ) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
