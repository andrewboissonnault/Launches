//
//  Mission.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Mission : Codable {
    let id : Int
    let name : String
    let description : String
    let type : Int
    let wikiURL : String
    let typeName : String
    let agencies : [Agency]?
    let payloads : [Payload]?
}
