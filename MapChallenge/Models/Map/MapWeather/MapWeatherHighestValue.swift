//
//  MapWeatherHighestValue.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation

// MARK: Constants

private struct Constants {
    static let missedValueString = ": -"
}

// MARK: HighestValue

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
        
        var infoString: String
        
        switch self {
        case .hottestTemperature:
            infoString = DescriptionConstructor.formString(Localization.hottestTempMessage, value: model.main?.temp)
        case .mostHumidity:
            infoString = DescriptionConstructor.formString(Localization.mostHumidityMessage, value: model.main?.humidity)
        case .mostWind:
            infoString = DescriptionConstructor.formString(Localization.mostWindMessage, value: model.wind?.speed)
        case .mostRain:
            infoString = DescriptionConstructor.formString(Localization.mostRainMessage, value: model.rain?.rainPerHour)
        }
        
        return  infoString.contains(Constants.missedValueString) ? infoString : "\(infoString) \(model.direction ?? "")"
    }

}
