//
//  LaunchCellViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct LaunchBasicInfo {
    let name : String
    let launch : String
    let rocketshipImageUrl : URL?
}

struct LaunchViewModel {
    let basicInfo : LaunchBasicInfo
    let mission : String
}

extension LaunchBasicInfo {
    init(_ launch: Launch) {
        self.name = launch.name
        self.launch = LaunchBasicInfo.launchText(launch)
        self.rocketshipImageUrl = URL(string: launch.rocket.imageURL)
    }
    
    private static func launchText(_ launch : Launch) -> String {
        let startText = displayFormatter.string(from: launch.isostart)
        let endText = displayFormatter.string(from: launch.isoend)
        return "\(startText) - \(endText)"
    }
}

extension LaunchViewModel {
    init(_ launch : Launch) {
        self.basicInfo = LaunchBasicInfo.init(launch)
        self.mission = LaunchViewModel.missionText(count : launch.missions.count)
    }
    
    private static func missionText(count : Int) -> String {
        if count == 1 {
            return "1 Mission"
        }
        else {
            return "\(count) Missions"
        }
    }
}
