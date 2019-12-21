//
//  LaunchIntegrationTests.swift
//  LaunchIntegrationTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class LaunchIntegrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchRequest() {
        let expectation = XCTestExpectation(description: "Fetch Launches")
        
        let networkManager = NetworkManagerII()
        
        networkManager.fetchLaunches { (launchJson, error) in
            
            XCTAssertNotNil(launchJson, "Json is nil")
            
            let count = launchJson?["count"] as? Int
            let offset = launchJson?["offset"] as? Int
            let total = launchJson?["total"] as? Int
            let launches = launchJson?["launches"] as? [Any]
            
            XCTAssertNotNil(launchJson, "Count is nil")
            XCTAssertNotNil(launchJson, "Offset is nil")
            XCTAssertNotNil(launchJson, "Total is nil")
            XCTAssertNotNil(launchJson, "Launches are nil")
                
            XCTAssertEqual(count,20)
            XCTAssertEqual(offset,0)
            XCTAssertEqual(launches?.count,20)
            
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
