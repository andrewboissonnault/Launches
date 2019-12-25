//
//  MissionsViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct RocketViewModel {
    let text : NSAttributedString
}

extension RocketViewModel {
    init(_ rocket : Rocket) {
        self.text = RocketViewModel.descriptionText(rocket)
    }
}

extension RocketViewModel {
    private static func descriptionText(_ rocket : Rocket) -> NSAttributedString {
        let name = NSMutableAttributedString.buildWithLink(string: rocket.name, urlString: rocket.wikiURL)
        return name
    }
}
