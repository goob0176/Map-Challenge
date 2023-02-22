//
//  PlaceWeatherModelTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class PlaceWeatherModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.placeWeatherModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(PlaceWeatherModel.self, from: data)
        
        XCTAssertNotNil(model.main)
        XCTAssertNotNil(model.coord)
        XCTAssertNotNil(model.wind?.speed)
        XCTAssertNotNil(model.rain?.rainPerHour)
        
        XCTAssertEqual(model.main?.temp, 20.0)
        XCTAssertEqual(model.main?.humidity, 5)
        
        XCTAssertEqual(model.coord?.lat, 44.34)
        XCTAssertEqual(model.coord?.lon, 10.99)
        XCTAssertEqual(model.wind?.speed, 0.62)
        XCTAssertEqual(model.rain?.rainPerHour, 3.51)
    }
}
