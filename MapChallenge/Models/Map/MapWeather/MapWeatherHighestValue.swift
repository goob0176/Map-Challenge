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
}

extension HighestValue {
    func value(from model: PlaceWeatherModel?) -> String {
        guard let model = model else {
            return ""
        }
        switch self {
        case .hottestTemperature:
            return formString(Localization.hottestTempMessage, value: model.main?.temp)
        case .mostHumidity:
            return formString(Localization.mostHumidityMessage, value: model.main?.humidity)
        case .mostWind:
            return formString(Localization.mostWindMessage, value: model.wind?.speed)
        }
    }
    
    private func formString<T: Equatable>(_ prefix: String, value: T?) -> String {
        guard let value = value else {
            return "\(prefix): -"
        }
        return "\(prefix): \(value)"
    }
}
