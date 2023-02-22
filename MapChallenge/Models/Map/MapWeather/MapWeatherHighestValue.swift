//
//  MapWeatherHighestValue.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation

enum HighestValue: CaseIterable {
    case hottestTemperature
    case mostHumidity
    case mostWind
    case mostRain
}

extension HighestValue {
    func value(from model: PlaceWeatherModel?) -> String {
        guard let model = model else {
            return ""
        }
        switch self {
        case .hottestTemperature:
            return DescriptionConstructor.formString(Localization.hottestTempMessage, value: model.main?.temp)
        case .mostHumidity:
            return DescriptionConstructor.formString(Localization.mostHumidityMessage, value: model.main?.humidity)
        case .mostWind:
            return DescriptionConstructor.formString(Localization.mostWindMessage, value: model.wind?.speed)
        case .mostRain:
            return DescriptionConstructor.formString(Localization.mostRainMessage, value: model.rain?.rainPerHour)
        }
    }

}
