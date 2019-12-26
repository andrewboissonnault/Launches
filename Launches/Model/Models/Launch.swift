//
//  Launch.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

struct Launch : Codable {
    let id : Int
    let name : String
    let tbddate : Int
    let tbdtime : Int
    let status : LaunchStatus
    let isostart : Date
    let isoend : Date
    let isonet : Date
    let infoURLs : [String]
    let vidURLs : [String]
    let holdreason : String?
    let failreason : String?
    let probability : Int
    let hashtag : String?
    let lsp : Agency
    let location : Location
    let rocket : Rocket
    let missions : [Mission]
}
