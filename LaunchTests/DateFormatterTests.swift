//
//  LaunchesTests.swift
//  LaunchesTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class DateFormatterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testISOFormatter() {
        let dateString = "20191226T231200Z"
        
        let date = isoFormatter.date(from: dateString)
        
        XCTAssertNotNil(date, "Expected non nil date")
    }

}
