//
//  PlaceWeatherModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

struct PlaceWeatherModel: Decodable {
    private static let kLineBreakSeparator = "\n"
    
    let main: MainWeatherModel?
    let coord: WeatherCoordinationsModel?
    let wind: WindModel?
    let rain: RainModel?

    var direction: String?    
    var infoValue: String {
        [
            direction?.uppercased(),
            DescriptionConstructor.formString(Localization.tempMessage, value: main?.temp),
            DescriptionConstructor.formString(Localization.humidityMessage, value: main?.humidity),
            DescriptionConstructor.formString(Localization.windMessage, value: wind?.speed),
            DescriptionConstructor.formString(Localization.rainMessage, value: rain?.rainPerHour),
        ]
            .compactMap { $0 }
            .joined(separator: Self.kLineBreakSeparator)
    }
}
