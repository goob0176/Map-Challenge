//
//  PinAnnotation.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation

protocol PinAnnotation: AnyObject {
    var weatherModel: PlaceWeatherModel { get }
    var reuseId: String { get }
}
