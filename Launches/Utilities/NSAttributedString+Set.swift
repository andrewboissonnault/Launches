//
//  NSAttributedString+Set.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    static func buildWithLink(string : String, urlString : String?) -> NSAttributedString {
        let attributed = NSMutableAttributedString.init(string: string, attributes: UIFont.detailsAttributes())
        if let safeUrlString = urlString {
            if let safeUrl = URL.init(string: safeUrlString) {
                attributed.setAttributes(UIFont.linkAttributes(safeUrl), range: NSRange.init(location: 0, length: attributed.length))
            }
        }
        return attributed
    }
    
}
