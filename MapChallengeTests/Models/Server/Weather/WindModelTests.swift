//
//  WindModelTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class WindModelTests: XCTestCase {
    func testModelParsing() {
        let data = MocksDictionariesFactory.windModel.data(using: .utf8)!
        let decoder = JSONDecoder()
        let model = try! decoder.decode(WindModel.self, from: data)
        
        XCTAssertEqual(model.speed, 0.62)
    }
}
