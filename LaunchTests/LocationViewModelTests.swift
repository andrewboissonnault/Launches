//
//  LocationViewModelTests.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class LocationViewModelTests: XCTestCase {
    func testDescriptionText() {
        let name = "Wenchang Satellite"
        let countryCode = "CHN"
        let padAName = "Wenchang, China"
        let padAMapURL = "https://www.google.com/maps/?q=28.246017,102.026556"
        let padALatitude = 19.614354
        let padALongitude = 110.951057
        let padBName = "Pad B"
        let padBMapURL = "https://www.google.com/maps/?q=19.6143511,110.951011"
        let padBLatitude = 19.6143511
        let padBLongitude = 110.951011
        let padA = Pad.buildPad(name: padAName, mapURL: padAMapURL, latitude: padALatitude, longitude : padALongitude)
        let padB = Pad.buildPad(name: padBName, mapURL: padBMapURL, latitude: padBLatitude, longitude : padBLongitude)
        
        let location = Location.buildLocation(name: name, countryCode: countryCode, pads: [padA, padB])
        
        let viewModel = LocationViewModel(location)
        
        let string = viewModel.text.string
        
        let expectedString = "Wenchang Satellite (CHN)\n\nWenchang, China - (19.614354, 110.951057)\nPad B - (19.6143511, 110.951011)"
        
        let expectedURLA = URL.init(string : padAMapURL)!
        let expectedURLB = URL.init(string : padBMapURL)!
        
        XCTAssertEqual(string, expectedString)
        XCTAssertTrue(viewModel.text.containsLink(expectedURLA))
        XCTAssertTrue(viewModel.text.containsLink(expectedURLB))
    }
}
