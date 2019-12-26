//
//  NSAttributedString+Set.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    static func buildWithLink(string : String, urlString : String?, isCentered : Bool = false) -> NSAttributedString {
        let attributed = NSMutableAttributedString.init(string: string, attributes: UIFont.detailsAttributes())
        if let safeUrlString = urlString {
            if let safeUrl = URL.init(string: safeUrlString) {
                let attributes = isCentered ? UIFont.linkHeaderAttributes(safeUrl) : UIFont.linkAttributes(safeUrl)
                attributed.setAttributes(attributes, range: attributed.fullRange)
            }
        }
        return attributed
    }
    
    public var fullRange : NSRange {
        return NSRange.init(location: 0, length: self.length)
    }
    
}
