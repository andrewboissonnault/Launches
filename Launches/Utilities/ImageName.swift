//
//  ImageName.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

enum ImageName : String{
    case success
    case green
    case red
    case failure
    
    static func imageNameWithStatus(_ status : LaunchStatus) -> ImageName {
        switch status {
        case .Success:
            return .success
        case .Failed:
            return .failure
        case .Green:
            return .green
        case .Red:
            return .red
        }
    }
}

extension UIImage {
    convenience init?(name: ImageName) {
        self.init(named: name.rawValue)
    }
}
