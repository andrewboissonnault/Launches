//
//  LaunchResponse.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct LaunchResponse : Codable {
    let count : Int
    let total : Int
    let offset : Int
    let launches : [Launch]
}
