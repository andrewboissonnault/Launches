//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct MissionsViewModel {
    let missions : [MissionViewModel]
}

extension MissionsViewModel {
    init(_ missions : [Mission]) {
        self.missions = missions.map { mission in
            return MissionViewModel.init(mission)
        }
    }
}
