//
//  LaunchesTests.swift
//  LaunchesTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import LaunchNetworking

class LaunchNetworkingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchLaunches() {
        let expectation = XCTestExpectation(description: "Fetch Launches")
        let urlBuilder = URLBuilder.init()
        let urlSession = MockURLSession()
        let dataTask = MockURLSessionDataTask()
        dataTask.nextData = dataFromJsonFile(filename: .successResponse)
        dataTask.nextError = nil
        dataTask.nextResponse = nil

        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManager.init(urlBuilder: urlBuilder, urlSession: urlSession)

        networkManager.fetchLaunches { (data, error) in

            XCTAssertNotNil(data, "Json is nil")
            XCTAssertNil(error, "Error is not nil")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithError() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Error")
        let urlBuilder = URLBuilder.init()
        let urlSession = MockURLSession()
        let dataTask = MockURLSessionDataTask()
        dataTask.nextData = nil
        dataTask.nextError = LaunchNetworkingError.networkingError
        dataTask.nextResponse = nil

        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManager.init(urlBuilder: urlBuilder, urlSession: urlSession)

        networkManager.fetchLaunches { (launchJson, error) in

            XCTAssertNil(launchJson, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

            guard let castedError = error as? LaunchNetworkingError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .networkingError = castedError {
                expectation.fulfill()
            }
            else {
                XCTFail("Error was not .networkingError")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLaunchesWithMissingData() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Missing Data")
        let urlBuilder = URLBuilder.init()
        let urlSession = MockURLSession()
        let dataTask = MockURLSessionDataTask()
        dataTask.nextData = nil
        dataTask.nextError = nil
        dataTask.nextResponse = nil

        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManager.init(urlBuilder: urlBuilder, urlSession: urlSession)

        networkManager.fetchLaunches { (launchJson, error) in

            XCTAssertNil(launchJson, "Json is not nil")
            XCTAssertNotNil(error, "Error is nil")

            guard let castedError = error as? LaunchNetworkingError else {
                XCTFail("Error casting to LaunchNetworkingError.")
                expectation.fulfill()
                return
            }

            if case .missingData = castedError {
                expectation.fulfill()
            }
            else {
                XCTFail("Error was not .missingData")
                expectation.fulfill()
                return
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
