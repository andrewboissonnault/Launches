//
//  Rocket.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Rocket : Codable {
    let id : Int
    let name : String
    let configuration : String
    let familyname : String
    let agencies : [Agency]?
    let wikiURL : String
    let infoURLs : [String]
    let imageURL : String
    let imageSizes : [Int]
}
