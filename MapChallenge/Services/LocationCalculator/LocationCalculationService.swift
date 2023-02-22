//
//  LocationCalculationService.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation
import MapKit

// MARK: - Constants

private struct Constants {
    static let earthRadiusInMeters = 6372797.6
    static let degreesOffset = 180.0
}

// MARK: - LocationCalculationService

struct LocationCalculationService: LocationCalculator {
    func locations(from coordinate: CLLocationCoordinate2D, wideDistanse: Double) -> [SideLocationModel] {
        Direction.allCases.map {
            SideLocationModel(
                direction: $0,
                coordinate: locationWithBearing(
                    bearing: $0.bearingDegree,
                    distanceMeters: wideDistanse,
                    origin: coordinate
                )
            )
        }
    }
    
    
    private func locationWithBearing(bearing: Double, distanceMeters: Double, origin: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let pi = Double.pi
        let distRadians = distanceMeters / (Constants.earthRadiusInMeters)
        
        let lat1 = origin.latitude * pi / Constants.degreesOffset
        let lon1 = origin.longitude * pi / Constants.degreesOffset
        
        let lat2 = asin(sin(lat1) * cos(distRadians) + cos(lat1) * sin(distRadians) * cos(bearing))
        let lon2 = lon1 + atan2(sin(bearing) * sin(distRadians) * cos(lat1), cos(distRadians) - sin(lat1) * sin(lat2))
        
        return CLLocationCoordinate2D(latitude: lat2 * Constants.degreesOffset / pi, longitude: lon2 * Constants.degreesOffset / pi)
    }
}
