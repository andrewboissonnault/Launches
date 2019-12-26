//
//  Launch.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Agency : Codable {
    let id : Int
    let name : String
    let abbrev : String
    let type : Int
    let countryCode : String
    let wikiURL : String
    let infoURLs : [String]
}
