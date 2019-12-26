//
//  LaunchesUITests.swift
//  LaunchesUITests
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest

class LaunchesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testList() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let cells = tablesQuery.cells
        let count = cells.count
        XCTAssert(count == 20)
        
        for i in 0..<cells.count {
            let element = cells.element(boundBy: i)
            let height = element.frame.size.height
            
            let text1 = element.staticTexts.element(boundBy: 0)
            let text2 = element.staticTexts.element(boundBy: 1)
            let text3 = element.staticTexts.element(boundBy: 2)
            
            XCTAssert(text1.exists)
            XCTAssert(text2.exists)
            XCTAssert(text3.exists)
            XCTAssert(cells.element.exists)
            XCTAssertGreaterThanOrEqual(height, 200)
        }
    }
    
    func testDetails() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let cells = tablesQuery.cells
        
        let element = cells.element(boundBy: 0)
        element.tap()
        
        
    }
}
