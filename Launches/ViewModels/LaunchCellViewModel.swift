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
    
}

extension LaunchCellViewModel {
    
    init(launch : Launch) {
        self.name = launch.name
    }
    
}
