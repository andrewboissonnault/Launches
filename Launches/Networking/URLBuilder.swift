//
//  UrlManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

private let defaultBaseUrl = "https://launchlibrary.net/1.4/"

class URLBuilder {
    private let baseUrl : URL
    
    init(baseUrl : URL) {
        self.baseUrl = baseUrl
    }
    
    convenience init() {
        guard let url = URL.init(string: defaultBaseUrl) else {
            preconditionFailure("Failed to init URL = \(defaultBaseUrl)")
        }
        self.init(baseUrl: url)
    }
    
    func launchUrl(count : Int) -> URL {
        let relativeUrl = "launch/next/\(count)"
        guard let url = URL.init(string: relativeUrl, relativeTo: baseUrl) else {
            preconditionFailure("Failed to init endpoint = \(relativeUrl)")
        }
        return url
    }
}
