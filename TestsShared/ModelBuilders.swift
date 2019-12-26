//
//  ModelBuilders.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation
@testable import Launches

extension Pad {
    static func buildPad(id: Int = 0, name: String = "", mapURL : String? = nil, latitude : Double = 0, longitude : Double = 0) -> Pad {
        let pad = Pad.init(id: id, name: name, mapURL: mapURL, latitude: latitude, longitude: longitude)
        return pad
    }
}

extension Mission {
    static func buildMission(id: Int = 0, name: String = "", description: String = "", type: Int = 0, wikiURL : String = "", typeName : String = "", agencies : [Agency]? = nil, payloads : [Payload]? = nil) -> Mission {
        let mission = Mission.init(id: id, name: name, description: description, type: type, wikiURL: wikiURL, typeName: typeName, agencies: agencies, payloads: payloads)
        return mission
    }
    
}

extension Rocket {
    static func buildRocket(id: Int = 0, name: String = "", config: String = "", familyname : String = "", agencies : [Agency]? = nil, wikiUrl : String = "", infoURLs : [String] = [], imageURL : String = "", imageSizes : [Int] = []) -> Rocket {
        let rocket = Rocket.init(id: id, name: name, configuration: config, familyname: familyname, agencies: agencies, wikiURL: wikiUrl, infoURLs: infoURLs, imageURL: imageURL, imageSizes: imageSizes)
        return rocket
    }
}

extension Agency {
    static func buildAgency(id: Int = 0, name: String = "", abbrev: String = "", type : Int = 0, countryCode : String = "", wikiUrl : String = "", infoURLs : [String] = []) -> Agency {
        let agency = Agency.init(id: id, name: name, abbrev: abbrev, type: type, countryCode: countryCode, wikiURL: wikiUrl, infoURLs: infoURLs)
        return agency
    }
}

extension Location {
    static func buildLocation(id: Int = 0, name: String = "", countryCode: String = "", pads: [Pad] = []) -> Location {
        let location = Location.init(id: id, name: name, countryCode: countryCode, pads: pads)
        return location
    }
}

extension Launch {
    static func buildLaunch(id: Int = 0, name: String = "", tbddate: Int = 0, tbdtime: Int = 0, status: LaunchStatus = .Success, isostart: Date = Date(), isoend: Date = Date(), infoURLs : [String] = [], vidURLs : [String] = [], holdreason : String = "", failreason : String = "", probability : Int = -1, hashtag : String = "", lsp : Agency = Agency.buildAgency(), location : Location = Location.buildLocation(), rocket: Rocket = Rocket.buildRocket(), missions : [Mission] = []) -> Launch {
        let launch = Launch.init(id: id, name: name, tbddate: tbddate, tbdtime: tbdtime, status: status, isostart: isostart, isoend: isoend, isonet: isostart, infoURLs: infoURLs, vidURLs: vidURLs, holdreason: holdreason, failreason: failreason, probability: probability, hashtag: hashtag, lsp: lsp, location: location, rocket: rocket, missions: missions)
        return launch
    }
}
