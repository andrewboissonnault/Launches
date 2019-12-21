//
//  NetworkManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

enum LaunchNetworkingError : Error {
    case missingData
    case jsonSerialization
    case casting
    case networkingError
}

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return (dataTask(with: url, completionHandler: completionHandler)
            as URLSessionDataTask) as URLSessionDataTaskProtocol
    }
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

class NetworkManager {
    private let urlBuilder : URLBuilder
    private let urlSession : URLSessionProtocol
    
    init(urlBuilder : URLBuilder, urlSession: URLSessionProtocol) {
        self.urlBuilder = urlBuilder
        self.urlSession = urlSession
    }
    
    convenience init() {
        self.init(urlBuilder: URLBuilder(), urlSession: URLSession.shared)
    }
    
    func fetchLaunches(_ completion: @escaping (_ result: [String:Any]?, _ error: Error?)->()) {
        let url = self.urlBuilder.launchUrl(count: 20)
        let task = self.urlSession.dataTask(with: url) { (data, response, error) in
            if let safeError = error {
                completion(nil, safeError)
                return
            }
            guard let safeData = data else {
                completion(nil, LaunchNetworkingError.missingData)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: safeData, options: []) else {
                completion(nil, LaunchNetworkingError.jsonSerialization)
                return
            }
            guard let dictionary = json as? [String : Any] else {
                completion(nil, LaunchNetworkingError.casting)
                return
            }
            completion(dictionary, nil)
        }
        task.resume()
    }
}
