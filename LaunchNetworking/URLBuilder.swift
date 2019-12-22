//
//  UrlManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

private let defaultBaseUrl = "https://launchlibrary.net/1.4/"

public class URLBuilder : NSObject {
    private let baseUrl : URL
    
    init(baseUrl : URL) {
        self.baseUrl = baseUrl
    }
    
    public convenience override init() {
        guard let url = URL.init(string: defaultBaseUrl) else {
            preconditionFailure("Failed to init URL = \(defaultBaseUrl)")
        }
        self.init(baseUrl: url)
    }
    
    @objc public func launchUrl(count : UInt) -> URL {
        let relativeUrl = "launch/next/\(count)"
        guard let url = URL.init(string: relativeUrl, relativeTo: baseUrl) else {
            preconditionFailure("Failed to init endpoint = \(relativeUrl)")
        }
        return url
    }
}
