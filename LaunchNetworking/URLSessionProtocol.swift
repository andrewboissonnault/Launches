//
//  NetworkingProtocols.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/21/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

@objc protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return (dataTask(with: url, completionHandler: completionHandler)
            as URLSessionDataTask) as URLSessionDataTaskProtocol
    }
}
