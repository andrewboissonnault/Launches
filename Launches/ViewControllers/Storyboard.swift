//
//  Storyboards.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    struct Name {
        static let launchDetails = "launchDetails"
    }
    
    static func launchDetailsVC(_ launch : Launch) -> LaunchDetailsViewController {
        guard let vc = self.viewController(name: Name.launchDetails) as? LaunchDetailsViewController else {
            fatalError("Error casting to LaunchDetailsViewController")
        }
        vc.launch = launch
        return vc
    }
    
    static func viewController(name: String, storyboard : UIStoryboard = mainStoryboard()) -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: name)
        return vc
    }
    
    static func mainStoryboard() -> UIStoryboard {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        return sb
    }
}
