//
//  LaunchesTests.swift
//  LaunchesTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class LaunchNetworkTests: XCTestCase {

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
        dataTask.nextData = dataFromJsonFile(filename: "testResponse")
        dataTask.nextError = nil
        dataTask.nextResponse = nil
        
        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManager.init(urlBuilder: urlBuilder, urlSession: urlSession)
        
        networkManager.fetchLaunches { (launchJson, error) in
            
            XCTAssertNotNil(launchJson, "Json is nil")
            XCTAssertNil(error, "Error is not nil")
            
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

    func testFetchLaunchesWithError() {
        let expectation = XCTestExpectation(description: "Fetch Launches With Error")
        let urlBuilder = URLBuilder.init()
        let urlSession = MockURLSession()
        var dataTask = MockURLSessionDataTask()
        dataTask.nextData = nil
        dataTask.nextError = LaunchNetworkingError.networkingError
        dataTask.nextResponse = nil
        
        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManagerII.init(urlBuilder: urlBuilder, urlSession: urlSession)
        
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
        var dataTask = MockURLSessionDataTask()
        dataTask.nextData = nil
        dataTask.nextError = nil
        dataTask.nextResponse = nil
        
        urlSession.nextDataTask = dataTask
        let networkManager = NetworkManagerII.init(urlBuilder: urlBuilder, urlSession: urlSession)
        
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

class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    private (set) var lastURL: URL?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        lastURL = url
        nextDataTask.completionHandler = completionHandler
        return nextDataTask
    }
    
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var completionHandler : ((Data?, URLResponse?, Error?) -> Void)?
    var nextData : Data?
    var nextResponse : URLResponse?
    var nextError : Error?
    
    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true
        self.completionHandler?(nextData, nextResponse, nextError)
    }
}

private func dataFromJsonFile(filename : String) -> Data {
    if let path = pathWithFilename(filename : filename) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            fatalError("Error reading json from bundle file.")
        }
    }
    fatalError("Error finding json bundle file.")
}

private func pathWithFilename(filename : String) -> String? {
    let bundles = Bundle.allBundles
    for bundle in bundles {
        if let path = bundle.path(forResource: filename, ofType: "json") {
            return path
        }
    }
    return nil
}
