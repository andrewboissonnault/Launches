//
//  MissionViewModelTests.swift
//  MissionViewModelTests
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import XCTest
@testable import Launches

class MissionViewModelTests: XCTestCase {

    func testMissionText() {
        let name = "Mission A"
        let expectedDescription = "This is a mission to the moon."
        let mission = Mission.buildMission(name: name, description: expectedDescription)
        let viewModel = MissionViewModel(mission)
        
        let description = viewModel.description
        
        XCTAssertEqual(description.string, "Mission A - This is a mission to the moon.")
    }
    
    func testMissions() {
        let missionA = Mission.buildMission(name: "Mission A")
        let missionB = Mission.buildMission(name: "Mission B")
        let missionC = Mission.buildMission(name: "Mission C")
        
        let missions = [missionA, missionB, missionC]
        
        let viewModel = MissionsViewModel(missions)
        
        let first = viewModel.missions.first!
        let second = viewModel.missions[1]
        let third = viewModel.missions.last!
        
        XCTAssertEqual(first.description.string, "Mission A")
        XCTAssertEqual(second.description.string, "Mission B")
        XCTAssertEqual(third.description.string, "Mission C")
    }
}
