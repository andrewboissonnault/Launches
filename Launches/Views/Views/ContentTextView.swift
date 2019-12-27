//
//  NewLineTextView.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit


//I came across an issue where the intrinsic content size wasn't being calculated correctly for UITextView that contained an attributed string with new line characters '\n'.  This is a solution that counts the number of newline characters and adds the
class NewLineTextView : UITextView {
    
    override var intrinsicContentSize: CGSize {
        let size = contentSize
        let count = self.attributedText.string.split(separator: "\n").count
        var newlineHeight : CGFloat = 0
        if count == 1 {
            newlineHeight = UIFont.headerFont().lineHeight
        }
        else {
            newlineHeight = UIFont.headerFont().lineHeight + UIFont.detailsFont().lineHeight * CGFloat(2 - count)
        }
        return CGSize(width: size.width, height: size.height + newlineHeight)
    }
}
