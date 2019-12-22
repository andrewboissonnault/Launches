//
//  LaunchesTests.swift
//  LaunchesTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches
@testable import LaunchNetworking

class LaunchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchLaunches() {
        let expectation = XCTestExpectation(description: "Fetch Launches")
        let manager = MockNetworkManager()
        manager.nextData = dataFromJsonFile(filename: .successResponse)
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager)

        api.fetchLaunches { (response, error) in

            XCTAssertNotNil(response, "Json is nil")
            XCTAssertNil(error, "Error is not nil")

            XCTAssertEqual(response?.launches.count, 100)
            
            guard let first = response?.launches.first else {
                XCTFail("Expected non empty launches list.")
                return
            }
            
            XCTAssertEqual(first.id, 1212)
            XCTAssertEqual(first.name, "Proton-M/Blok DM-03 | Elektro-L No.3")


            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithMissingData() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Missing Data")
        let manager = MockNetworkManager()
        manager.nextData = nil
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager, decoder: JSONDecoder())

        api.fetchLaunches { (response, error) in

            XCTAssertNil(response, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

            guard let castedError = error as? LaunchError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .missingData = castedError {
                expectation.fulfill()
                return
            }
            else {
                XCTFail("Error was not .missingData")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithSerializationError() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Serialization Error")
        let manager = MockNetworkManager()
        manager.nextData = dataFromJsonFile(filename: .serializationError)
        manager.nextError = nil

        let api = LaunchAPI.init(networkManager: manager, decoder: JSONDecoder())

        api.fetchLaunches { (launchJson, error) in

            XCTAssertNil(launchJson, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

           guard let castedError = error as? LaunchError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .decodingError = castedError {
                expectation.fulfill()
                return
            }
            else {
                XCTFail("Error was not .decodingError")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

}


private class MockNetworkManager : NetworkManager {
    var nextData : Data?
    var nextError : Error?
    
    override func fetchLaunches(_ completion: @escaping (Data?, Error?) -> Void) {
        completion(nextData, nextError)
    }
}
