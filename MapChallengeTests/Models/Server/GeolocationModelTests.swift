//
//  GeolocationModelTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class GeocodingLocationModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.geolocationModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(GeocodingLocationModel.self, from: data)
        
        XCTAssertNotNil(model.name)
        XCTAssertNotNil(model.lat)
        XCTAssertNotNil(model.lon)

        XCTAssertEqual(model.name, "London")
        XCTAssertEqual(model.lat, 42.9834)
        XCTAssertEqual(model.lon, -81.233)
    }
}
