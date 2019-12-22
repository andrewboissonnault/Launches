//
//  Payload.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Payload : Codable {
    let id : Int
    let name : String
    let countryCodes : String?
    let description : String?
    let type : Int?
    let dimensions : String?
    let weight : String?
    let total : Int?
    let missionId : String?
    let changed : String?
}
