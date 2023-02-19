//
//  MapCoordinatorType.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation

protocol MapCoordinatorType {
    func goToCoordinates(receivedFrom model: PlaceWeatherModel)
    func presentError(with description: String?)
}
