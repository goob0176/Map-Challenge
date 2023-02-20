//
//  PlaceWeatherModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

struct PlaceWeatherModel: Decodable {
    let main: MainWeatherModel?
    let coord: WeatherCoordinationsModel?
    
    var tempValue: String {
        guard let temp = main?.temp else {
            return "-"
        }
        return "\(Int(temp))°"
    }
}
