//
//  MockURLSession.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation
@testable import LaunchNetworking

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
