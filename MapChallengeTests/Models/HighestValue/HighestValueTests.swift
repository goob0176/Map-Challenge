//
//  HighestValueTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 22.02.2023.
//


import Foundation
import XCTest
@testable import MapChallenge

final class HighestValueTests: XCTestCase {
    func testHighestValueStringForming() {
        let data = MocksDictionariesFactory.placeWeatherModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        var model = try! decoder.decode(PlaceWeatherModel.self, from: data)
        
        model.direction = Direction.west.rawValue
        let highestTemp = HighestValue.hottestTemperature.value(from: model)
        let mostHumidity = HighestValue.mostHumidity.value(from: model)
        let mostRain = HighestValue.mostRain.value(from: model)
        let mostWind = HighestValue.mostWind.value(from: model)
        
        XCTAssertEqual(highestTemp, "Hottest temp: 20.0 west")
        XCTAssertEqual(mostHumidity, "Most humidity: 5 west")
        XCTAssertEqual(mostRain, "Most rain: 3.51 west")
        XCTAssertEqual(mostWind, "Most wind: 0.62 west")
    }
    
    func testEmptyValueStringForming() {
        let model = PlaceWeatherModel(
            main: nil,
            coord: nil,
            wind: nil,
            rain: nil
        )
        
        let highestTemp = HighestValue.hottestTemperature.value(from: model)
        let mostHumidity = HighestValue.mostHumidity.value(from: model)
        let mostRain = HighestValue.mostRain.value(from: model)
        let mostWind = HighestValue.mostWind.value(from: model)
        
        XCTAssertEqual(highestTemp, "Hottest temp: -")
        XCTAssertEqual(mostHumidity, "Most humidity: -")
        XCTAssertEqual(mostRain, "Most rain: -")
        XCTAssertEqual(mostWind, "Most wind: -")
    }
}
