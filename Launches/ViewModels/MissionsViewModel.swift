//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct MissionViewModel {
    let description : NSAttributedString
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
    
    private static func descriptionText(_ mission : Mission) -> NSAttributedString {
        let nameFont = UIFont.systemFont(ofSize: 14, weight: .black)
        let descriptionFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        let nameAttributes = [NSAttributedString.Key.font : nameFont]
        let descriptionAttributes = [NSAttributedString.Key.font : descriptionFont]
        let name = NSMutableAttributedString.init(string: mission.name, attributes: nameAttributes)
        let descriptionString = " - \(mission.description)"
        let description = NSAttributedString.init(string: descriptionString, attributes: descriptionAttributes)
        name.append(description)
        return name
    }
}
