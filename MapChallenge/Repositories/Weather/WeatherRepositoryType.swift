//
//  WeatherRepositoryType.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

typealias WeatherResponse = (Result<PlaceWeatherModel, NetworkError>) -> Void

protocol WeatherRepositoryType {
    func fetchWeather(for title: String, completion: @escaping WeatherResponse)
    func fetchWeather(for lat: Double?, lon: Double?, completion: @escaping WeatherResponse)
}
