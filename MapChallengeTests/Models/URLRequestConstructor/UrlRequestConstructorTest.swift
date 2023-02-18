//
//  UrlRequestConstructorTest.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

import Foundation
import XCTest
@testable import MapChallenge

final class UrlRequestConstructorTest: XCTestCase {
    var sut: RequestConstructor!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLRequestConstructor()
    }
    
    func testBasicRequestConstructor() {
        let requestable: Requestable = NetworkRequest(
            host: "host.com",
            path: "/path",
            params: [:],
            timeoutInterval: 10.0,
            method: .get
        )
        
        let urlRequest = sut.urlRequest(from: requestable)
        
        XCTAssertNotNil(urlRequest)
        
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://host.com/path")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.timeoutInterval, 10.0)
    }
    
    func testRequestWithParamsConstructor() {
        let requestable: Requestable = NetworkRequest(
            host: "host.com",
            path: "/path",
            params: [
                "param1": 1,
                "param2": "test"
            ],
            timeoutInterval: 10.0,
            method: .get
        )
        
        let urlRequest = sut.urlRequest(from: requestable)
        
        XCTAssertNotNil(urlRequest)
        
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://host.com/path?param1=1&param2=test")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.timeoutInterval, 10.0)
    }
    
    func testRequestFromIncorrectPathIsNil() {
        let requestable: Requestable = NetworkRequest(
            host: "host",
            path: "invalidPath",
            params: [:],
            timeoutInterval: 10.0,
            method: .get
        )
        
        let urlRequest = sut.urlRequest(from: requestable)
        
        XCTAssertNil(urlRequest)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
