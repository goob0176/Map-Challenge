//
//  PlaceWeatherModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

struct PlaceWeatherModel: Decodable {
    let main: MainWeatherModel?
    let coord: WeatherCoordinationsModel?
    let wind: WindModel?
    
    var tempValue: String {
        guard let temp = main?.temp else {
            return "-"
        }
        return "\(Int(temp))°"
    }
    
    var windSpeedValue: String {
        guard let speed = wind?.speed else {
            return  "\(Localization.mostWindMessage): -"
        }
        return "\(Localization.mostWindMessage): \(speed)"
    }
}
