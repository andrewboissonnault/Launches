//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct MissionViewModel {
    let description : String
}

struct MissionsViewModel {
    let missions : [MissionViewModel]
//    let name : String
//    let launch : String
//    let rocketshipImageUrl : URL?
}

extension MissionsViewModel {
    init(_ missions : [Mission]) {
        self.missions = missions.map { mission in
            return MissionViewModel.init(mission)
        }
    }
}

extension MissionViewModel {
    init(_ mission : Mission) {
        self.description = MissionViewModel.descriptionText(mission)
    }
    
    private static func descriptionText(_ mission : Mission) -> String {
        let text = "\(mission.name) - \(mission.description)"
        return text
    }
}
