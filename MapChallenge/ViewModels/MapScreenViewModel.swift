//
//  MapScreenViewModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct MapScreenViewModel: MapScreenViewModelType {
    private let weatherRepository: WeatherRepositoryType
    private let coordinator: MapCoordinatorType
    
    init(
        weatherRepository: WeatherRepositoryType = WeatherRepository(),
        coordinator: MapCoordinatorType
    ) {
        self.weatherRepository = weatherRepository
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
    
    private func handleItemTapped(coordinates: WeatherCoordinationsModel?) {}
}
