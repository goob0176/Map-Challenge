//
//  NetworkErrorTests.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation
import XCTest
@testable import MapChallenge

final class NetworkErrorTests: XCTestCase {
    private static let kDataReceivingErrorDescription = "Data receiving error!"
    
    func testLocalizedDescriptionOfError() {
        let invalidUrlError = NetworkError.invalidUrl
        let serverError = NetworkError.serverError
        let dataReceivingError = NetworkError.dataReceivingError(description: Self.kDataReceivingErrorDescription)
        
        XCTAssertEqual(invalidUrlError.localizedDescription, Localization.invalidUrlErrorMsg)
        XCTAssertEqual(serverError.localizedDescription, Localization.serverErrorMsg)
        XCTAssertEqual(dataReceivingError.localizedDescription, Self.kDataReceivingErrorDescription)
    }
}
