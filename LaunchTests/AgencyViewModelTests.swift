//
//  AgencyViewModelTests.swift
//  AgencyViewModelTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class AgencyViewModelTests: XCTestCase {
    func testDescriptionText() {
        let abbrev = "KhSC"
        let name = "Khrunichev"
        let countryCode = "RUS"
        let wikiURL = "http://www.google.com"
        let agency = Agency.buildAgency(name: name, abbrev: abbrev, countryCode: countryCode, wikiUrl: wikiURL)
        
        let viewModel = AgencyViewModel(agency)
        
        let description = viewModel.text
        
        let expectedUrl = URL.init(string: wikiURL)!
        
        XCTAssertEqual(description.string, "KhSC - Khrunichev (RUS)")
        XCTAssertTrue(description.containsLink(expectedUrl))
    }
}
