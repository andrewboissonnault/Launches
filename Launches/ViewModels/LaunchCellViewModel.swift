//
//  LaunchCellViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct LaunchCellViewModel {
    let name : String
    let launch : String
    let mission : String
}

extension LaunchCellViewModel {
    
    init(launch : Launch) {
        self.name = launch.name
        self.launch = launchText(launch)
        self.mission = missionText(count : launch.missions.count)
    }
}

private func launchText(_ launch : Launch) -> String {
    let startText = displayFormatter.string(from: launch.isostart)
    let endText = displayFormatter.string(from: launch.isoend)
    return "\(startText) - \(endText)"
}

private func missionText(count : Int) -> String {
    if count == 1 {
        return "1 Mission"
    }
    else {
        return "\(count) Missions"
    }
}
