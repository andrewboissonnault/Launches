//
//  LaunchModelController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

class LaunchModelController {
    
    let launch : Launch
    
    init(launch : Launch) {
        self.launch = launch
    }
}

extension LaunchModelController {
    
    var launchViewModel : LaunchViewModel {
        return LaunchViewModel(launch)
    }
    
    var missionsViewModel : MissionsViewModel {
        return MissionsViewModel(launch.missions)
    }
    
    var agencyViewModel : AgencyViewModel {
        return AgencyViewModel(launch.lsp)
    }
    
    var locationViewModel : LocationViewModel {
        return LocationViewModel(launch.location)
    }
    
    var rocketViewModel : RocketViewModel {
        return RocketViewModel(launch.rocket)
    }

}
