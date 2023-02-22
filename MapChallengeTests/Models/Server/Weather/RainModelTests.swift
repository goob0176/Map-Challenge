//
//  RainModelTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 22.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class RainModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.rainModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try? decoder.decode(RainModel.self, from: data)
        
        XCTAssertNotNil(model)
        XCTAssertNotNil(model?.rainPerHour)
        
        XCTAssertEqual(model?.rainPerHour, 3.51)
    }
}

