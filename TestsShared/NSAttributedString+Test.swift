//
//  NSAttributedString+Test.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/25/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

//Enumerating the attributes of NSAttributedString uses blocks with a Void return value so these methods let you check the attachments in a synchronous manner for the tests.

extension NSAttributedString {
    
    func containsImageAsAttachment(_ image : UIImage) -> Bool {
        let semaphore = DispatchSemaphore(value: 0)
        let queue = DispatchQueue.global()
        var contains = false
        queue.async {
            self.enumerateAttribute(.attachment, in: self.fullRange, options: []) { (value, range, stop) in

                if (value is NSTextAttachment){
                    let attachment: NSTextAttachment? = (value as? NSTextAttachment)
                    if ((attachment?.image) == image) {
                        contains = true
                    }
                }
            }
        }
        let _ = semaphore.wait(timeout: .now() + 2.0)
        return contains
    }
    
    func containsLink(_ expectedUrl : URL) -> Bool {
        let semaphore = DispatchSemaphore(value: 0)
        let queue = DispatchQueue.global()
        var contains = false
        queue.async {
            self.enumerateAttribute(.link, in: self.fullRange, options: []) { (value, range, stop) in
                
                if (value is URL){
                    let url: URL = value as! URL
                    if (url == expectedUrl) {
                        contains = true
                    }
                }
            }
        }
        let _ = semaphore.wait(timeout: .now() + 2.0)
        return contains
    }
}
