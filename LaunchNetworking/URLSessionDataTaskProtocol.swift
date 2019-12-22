//
//  URLSessionDataTaskProtocol.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/21/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

@objc protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
