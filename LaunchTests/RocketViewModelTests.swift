//
//  RocketViewModelTests.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class RocketViewModelTests: XCTestCase {
    func testDescriptionText() {
        let name = "Falcon 9 Block 5"
        let wikiURL =  "http://en.wikipedia.org/wiki/SpaceX"
        let rocket = Rocket.buildRocket(name: name, wikiUrl: wikiURL)
        let viewModel = RocketViewModel(rocket)
        let string = viewModel.text.string
                
        let expectedURL = URL.init(string : wikiURL)!
        
        XCTAssertEqual(string, name)
        XCTAssertTrue(viewModel.text.containsLink(expectedURL))
    }
}
