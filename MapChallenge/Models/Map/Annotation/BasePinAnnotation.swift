//
//  BasePinAnnotation.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import MapKit

final class BasePinAnnotation: MKPointAnnotation, PinAnnotation {
    let weatherModel: PlaceWeatherModel
    let reuseId: String
    
    init(weatherModel: PlaceWeatherModel, reuseId: String) {
        self.weatherModel = weatherModel
        self.reuseId = reuseId
    }
}
