//
//  LocationCalculator.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation
import CoreLocation

protocol LocationCalculator {
    func locations(from coordinate: CLLocationCoordinate2D, wideDistanse: Double) -> [SideLocationModel]
}
