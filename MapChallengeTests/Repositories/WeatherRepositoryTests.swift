//
//  WeatherRepositoryTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class WeatherRepositoryTests: XCTestCase {
    func testSuccessfullResponseHandling() {
        let repository = WeatherRepository(
            dataService: DataServiceMock()
        )
        
        repository.fetchWeather(for: "London") { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.main?.temp, 20.0)
                XCTAssertEqual(model.main?.humidity, 5)
                XCTAssertEqual(model.coord?.lat, 44.34)
                XCTAssertEqual(model.coord?.lon, 10.99)
            case .failure:
                XCTFail("Error should not be thrown!")
            }
        }
    }
    
    func testErrorRaising() {
        let repository = WeatherRepository(
            dataService: DataServiceMock(shouldFail: true)
        )
        
        repository.fetchWeather(for: "London") { result in
            switch result {
            case .success:
                XCTFail("Error should be thrown!")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.serverError.localizedDescription)
            }
        }
    }
}
