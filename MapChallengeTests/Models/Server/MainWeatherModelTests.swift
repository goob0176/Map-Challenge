//
//  MainWeatherModelTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class MainWeatherModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.mainWeatherModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(MainWeatherModel.self, from: data)
        
        XCTAssertNotNil(model.temp)
        XCTAssertNotNil(model.humidity)

        XCTAssertEqual(model.temp, 20.0)
        XCTAssertEqual(model.humidity, 5)
    }
}
