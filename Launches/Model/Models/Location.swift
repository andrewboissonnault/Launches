//
//  Launch.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Location : Codable {
    let id : Int
    let name : String
    let countryCode : String
    let pads : [Pad]
}
