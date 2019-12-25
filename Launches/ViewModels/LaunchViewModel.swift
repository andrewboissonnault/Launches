//
//  LaunchCellViewModel.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

struct LaunchViewModel {
    let name : NSAttributedString
    let launch : String
    let rocketshipImageUrl : URL?
    let mission : String
}

extension LaunchViewModel {
    init(_ launch: Launch) {
        self.name = LaunchViewModel.nameText(launch)
        self.launch = LaunchViewModel.launchText(launch)
        self.rocketshipImageUrl = URL(string: launch.rocket.imageURL)
        self.mission = LaunchViewModel.missionText(count : launch.missions.count)
    }
}

extension LaunchViewModel {
    private static func missionText(count : Int) -> String {
        if count == 1 {
            return "1 Mission"
        }
        else {
            return "\(count) Missions"
        }
    }
    
    private static func launchText(_ launch : Launch) -> String {
        let startText = displayFormatter.string(from: launch.isostart)
        let endText = displayFormatter.string(from: launch.isoend)
        return "\(startText) - \(endText)"
    }
    
    private static func nameText(_ launch : Launch) -> NSAttributedString {
        let name = NSMutableAttributedString.init(string: "\(launch.name)  ", attributes: UIFont.headerAttributes())
        
        let icon = LaunchViewModel.statusIcon(launch.status)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = icon
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        name.append(imageString)
        return name
    }
    
    private static func statusIcon(_ status : LaunchStatus) -> UIImage? {
        let name = LaunchViewModel.statusIconName(status)
        let image = UIImage(name: name)
        return image
    }
    
    private static func statusIconName(_ status : LaunchStatus) -> ImageName {
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

enum ImageName : String{
    case success
    case green
    case red
    case failure
}

extension UIImage {
    
    convenience init?(name: ImageName) {
        self.init(named: name.rawValue)
    }
    
}
