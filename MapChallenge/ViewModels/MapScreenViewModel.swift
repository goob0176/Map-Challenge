//
//  MapScreenViewModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import CoreLocation

struct MapScreenViewModel: MapScreenViewModelType {
    private let weatherRepository: WeatherRepositoryType
    private let locationsCalculator: LocationCalculator
    private let coordinator: MapCoordinatorType
    
    private static let kSideLocationsOffsetMeters = 200000.0
    
    init(
        weatherRepository: WeatherRepositoryType = WeatherRepository(),
        locationsCalculator: LocationCalculator = LocationCalculationService(),
        coordinator: MapCoordinatorType
    ) {
        self.weatherRepository = weatherRepository
        self.locationsCalculator = locationsCalculator
        self.coordinator = coordinator
    }
    
    func getWeather(for place: String) {
        weatherRepository.fetchWeather(for: place, completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    coordinator.goToCoordinates(receivedFrom: model, onItemTapped: {
                        handleItemTapped(coordinates: model.coord)
                    })
                case .failure(let error):
                    coordinator.presentError(with: error.localizedDescription)
                }
            }
        })
    }
    
    private func handleItemTapped(coordinates: WeatherCoordinationsModel?) {
        guard let lat = coordinates?.lat,
              let lon = coordinates?.lon else {
            return
        }
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let locations = locationsCalculator.locations(from: coordinate, wideDistanse: Self.kSideLocationsOffsetMeters)
        
        let group = DispatchGroup()
        var weatherModels = [PlaceWeatherModel]()
        
        locations.forEach { coordinate in
            group.enter()
            weatherRepository.fetchWeather(for: coordinate.latitude, lon: coordinate.longitude) { result in
                switch result {
                case .success(let model):
                    weatherModels.append(model)
                case .failure(let error):
                    coordinator.presentError(with: error.localizedDescription)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            var mapModels = [
                MapWeatherModel.model(
                    sortedFrom: weatherModels, using: { $0.main?.temp ?? 0.0 > $1.main?.temp ?? 0.0 },
                    highestValue: .hottestTemperature
                ),
                MapWeatherModel.model(
                    sortedFrom: weatherModels, using: { $0.main?.humidity ?? 0 > $1.main?.humidity ?? 0 },
                    highestValue: .mostHumidity
                )
            ]
            coordinator.placeSideLocationsMarkers(on: mapModels)
        }
    }
}
