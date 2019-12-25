//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct LocationViewModel {
    let text : NSAttributedString
}

extension LocationViewModel {
    init(_ location : Location) {
        self.text = LocationViewModel.descriptionText(location)
    }
}

extension LocationViewModel {
    private static func descriptionText(_ location : Location) -> NSAttributedString {
        let locationString = "\(location.name) (\(location.countryCode))\n"
        let locationText = NSMutableAttributedString.init(string: locationString, attributes: UIFont.headerAttributes())
        
        for pad in location.pads {
            let padText = LocationViewModel.padText(pad)
            locationText.append(padText)
        }
        return locationText
    }
    
    private static func padText(_ pad : Pad) -> NSAttributedString {
        let name = NSMutableAttributedString.init(string: "\n\(pad.name)", attributes: UIFont.detailsAttributes())
        let coordinatesString = "(\(pad.latitude), \(pad.longitude))"
        let coordinates = NSAttributedString.buildWithLink(string: coordinatesString, urlString: pad.mapURL)
        let dash = NSAttributedString.init(string: " - ", attributes: UIFont.detailsAttributes())
        name.append(dash)
        name.append(coordinates)
        return name
    }
}
