//
//  UIFont+Launches.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

extension UIFont {
    static func headerFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    static func detailsBoldFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .black)
    }
    
    static func detailsFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    static func headerAttributes() -> [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return [NSAttributedString.Key.font : UIFont.headerFont(), NSAttributedString.Key.paragraphStyle : paragraphStyle]
    }
    
    static func detailsAttributes() -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font : UIFont.detailsFont()]
    }
    
    static func detailsBoldAttributes() -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font : UIFont.detailsBoldFont()]
    }
    
    static func linkAttributes(_ url : URL) -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font : UIFont.detailsFont(), NSAttributedString.Key.link : url]
    }
    
    static func linkHeaderAttributes(_ url : URL) -> [NSAttributedString.Key : Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return [NSAttributedString.Key.font : UIFont.detailsFont(), NSAttributedString.Key.link : url, NSAttributedString.Key.paragraphStyle : paragraphStyle]
    }
}
