//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct AgencyViewModel {
    let text : NSAttributedString
}

extension AgencyViewModel {
    init(_ agency : Agency) {
        self.text = AgencyViewModel.descriptionText(agency)
    }
}

extension AgencyViewModel {
    private static func descriptionText(_ agency : Agency) -> NSAttributedString {
        let boldAttributes = UIFont.detailsBoldAttributes()
        let defaultAttributes = UIFont.detailsAttributes()
        let abbreviation = NSMutableAttributedString.init(string: agency.abbrev, attributes: boldAttributes)
        let dash = NSAttributedString.init(string: " - ", attributes: defaultAttributes)
        let name = NSMutableAttributedString.buildWithLink(string: agency.name, urlString: agency.wikiURL)
        let country = NSAttributedString.init(string: " (\(agency.countryCode))", attributes: defaultAttributes)
        abbreviation.append(dash)
        abbreviation.append(name)
        abbreviation.append(country)
        return abbreviation
    }
}
