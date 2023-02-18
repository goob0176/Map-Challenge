//
//  WeatherCoordinatesModel.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//
import Foundation
import XCTest
@testable import MapChallenge

final class WeatherCoordinatesModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.weatherCoordinates.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(WeatherCoordinationsModel.self, from: data)
        
        XCTAssertEqual(model.lat, 44.34)
        XCTAssertEqual(model.lon, 10.99)

        XCTAssertEqual(model.lat, 44.34)
        XCTAssertEqual(model.lon, 10.99)
    }
}
