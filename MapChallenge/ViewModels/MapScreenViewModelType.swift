//
//  MapScreenViewModelType.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

protocol MapScreenViewModelType {
    func getWeather(for place: String, completion: @escaping WeatherResponse)
}
