//
//  Pad.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Pad : Codable {
    let id : Int
    let name : String
    let mapURL : String?
    let latitude : Double
    let longitude : Double
}
