//
//  RequestsFactory.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

import Foundation

// MARK: - Constants

private struct Constants {
    static let host = "api.openweathermap.org"
    static let appId = "9ee612c9cc9116497bee16b18725fcf7"
    static let timeoutInterval = 10.0
    static let limitParameter = 1
    
    static let celciusMetricParam = "metric"
    
    struct Paths {
        static let geocoding = "/geo/1.0/direct"
        static let weather = "/data/2.5/weather"
    }
}

// MARK: - RequestsFactory

struct RequestsFactory {
    static func geocodingRequest(_ placeTitle: String) -> some Requestable {
        NetworkRequest(
            host: Constants.host,
            path: Constants.Paths.geocoding,
            params: [
                "q": placeTitle,
                "limit": Constants.limitParameter,
                "appId": Constants.appId
            ],
            timeoutInterval: Constants.timeoutInterval,
            method: .get
        )
    }
    
    static func placeRequest(latitude: Double, longitude: Double) -> some Requestable {
        NetworkRequest(
            host: Constants.host,
            path: Constants.Paths.weather,
            params: [
                "lat": "\(latitude)",
                "lon": "\(longitude)",
                "units": Constants.celciusMetricParam,
                "appId": Constants.appId
            ],
            timeoutInterval: Constants.timeoutInterval,
            method: .get
        )
    }
}
