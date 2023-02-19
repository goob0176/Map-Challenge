//
//  MapScreenViewModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct MapScreenViewModel: MapScreenViewModelType {
    private let weatherRepository: WeatherRepositoryType
    
    init(weatherRepository: WeatherRepositoryType = WeatherRepository()) {
        self.weatherRepository = weatherRepository
    }
    
    func getWeather(for place: String, completion: @escaping WeatherResponse) {
        weatherRepository.fetchWeather(for: place, completion: completion)
    }
}
