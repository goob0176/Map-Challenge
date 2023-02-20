//
//  MapCoordinatorType.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import CoreLocation

protocol MapCoordinatorType {
    func goToCoordinates(receivedFrom model: PlaceWeatherModel, onItemTapped: @escaping ()->Void)
    func placeSideLocationsMarkers(on models: [PlaceWeatherModel])
    func presentError(with description: String?)
}
