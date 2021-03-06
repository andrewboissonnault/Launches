//
//  LaunchIntegrationTests.swift
//  LaunchIntegrationTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import LaunchNetworking

class LaunchNetworkingIntegrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchRequest() {
        let expectation = XCTestExpectation(description: "Fetch Launches")
        
        let networkManager = NetworkManager()
        
        networkManager.fetchLaunches { (data, error) in
            
            XCTAssertNotNil(data, "Data is nil")
            XCTAssertNil(error, "Error is not nil")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
