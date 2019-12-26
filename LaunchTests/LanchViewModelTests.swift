//
//  LaunchViewModelTests.swift
//  LaunchViewModelTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class LaunchViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchNameSuccess() {
        let launchName = "Launch Name"
        let launch = Launch.buildLaunch(name : launchName)
        let viewModel = LaunchViewModel.init(launch)
        
        let name = viewModel.name
        
        XCTAssertEqual(viewModel.name.attributedSubstring(from: NSRange(location: 0, length: launchName.count+2)).string, "Launch Name  ")
        
        let image = UIImage.init(name: .success)!
        
        XCTAssertTrue(name.containsImageAsAttachment(image), "Expected string to contain success image")
    }
    
    func testLaunchIcons() {
        for status in LaunchStatus.allCases {
            let launch = Launch.buildLaunch(status: status)
            let viewModel = LaunchViewModel.init(launch)
            let name = viewModel.name
            let imageName = ImageName.imageNameWithStatus(status)
            let image = UIImage.init(name: imageName)
            XCTAssertTrue(name.containsImageAsAttachment(image!), "Expected string to contain \(imageName) image")
        }
    }
    
    func testLaunchText() {
        let startDate = isoFormatter.date(from: "20191224T120000Z")!
        let endDate = isoFormatter.date(from: "20191224T124000Z")!
        let launch = Launch.buildLaunch(isostart: startDate, isoend: endDate)
        
        let viewModel = LaunchViewModel.init(launch)
        XCTAssertEqual(viewModel.launch, "December 24, 2019, 07:00:00 - December 24, 2019, 07:40:00")
    }
    
    func testImageUrl() {
        let rocketshipImage = "https://s3.amazonaws.com/launchlibrary/RocketImages/placeholder_1920.png"
        let rocket = Rocket.buildRocket(imageURL: rocketshipImage)
        let launch = Launch.buildLaunch(rocket: rocket)
        let viewModel = LaunchViewModel.init(launch)
        
        let expectedIconURL = URL.init(string: rocketshipImage)!
        XCTAssertEqual(viewModel.rocketshipImageUrl, expectedIconURL)
    }
    
    func testMissionText() {
        let missions : [Mission] = []
        let launch = Launch.buildLaunch(missions: missions)
        let viewModel = LaunchViewModel.init(launch)
        
        XCTAssertEqual(viewModel.mission, "0 Missions")
    }
    
    func testMissionTextSingular() {
        let mission = Mission.buildMission()
        let missions : [Mission] = [mission]
        let launch = Launch.buildLaunch(missions: missions)
        let viewModel = LaunchViewModel.init(launch)
        
        XCTAssertEqual(viewModel.mission, "1 Mission")
    }
}
