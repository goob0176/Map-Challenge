//
//  MapWeatherModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation

typealias WeatherSortingModel = ((PlaceWeatherModel, PlaceWeatherModel)->Bool)

struct MapWeatherModel {
    let coordinates: WeatherCoordinationsModel?
    let valueStirng: String
    
    static func model(
        sortedFrom array: [PlaceWeatherModel],
        using closure: WeatherSortingModel,
        highestValue: HighestValue
    ) -> MapWeatherModel {
        let firstModel = array.sorted(by: closure).first
        return MapWeatherModel(coordinates: firstModel?.coord, valueStirng: highestValue.value(from: firstModel))
    }
}
