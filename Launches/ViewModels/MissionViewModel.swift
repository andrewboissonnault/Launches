//
//  MissionViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct MissionViewModel {
    let description : NSAttributedString
}

extension MissionViewModel {
    init(_ mission : Mission) {
        self.description = MissionViewModel.descriptionText(mission)
    }
    
    private static func descriptionText(_ mission : Mission) -> NSAttributedString {
        let name = NSMutableAttributedString.init(string: mission.name, attributes: UIFont.detailsBoldAttributes())
        if mission.description.count == 0 {
            return name
        }
        let descriptionString = " - \(mission.description)"
        let description = NSAttributedString.init(string: descriptionString, attributes: UIFont.detailsAttributes())
        name.append(description)
        return name
    }
}
