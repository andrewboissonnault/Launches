//
//  LaunchAPI.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation
import LaunchNetworking

class LaunchAPI {
    
    private let networkManager : NetworkManager
    private let decoder : JSONDecoder
    
    init(networkManager : NetworkManager = NetworkManager(), decoder : JSONDecoder = LaunchAPI.buildDecoder()) {
        self.networkManager = networkManager
        self.decoder = decoder
    }
    
    private static func buildDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(isoFormatter)
        return decoder
    }
    
    func fetchLaunches(_ completion: @escaping (_ result: LaunchResponse?, _ error: Error?)->()) {
        self.networkManager.fetchLaunches { (data, error) in
            if let safeError = error {
                completion(nil, safeError)
                return
            }
            guard let safeData = data else {
                completion(nil, LaunchError.missingData)
                return
            }
            
            guard let response = try? self.decoder.decode(LaunchResponse.self, from: safeData) else {
                completion(nil, LaunchError.decodingError)
                return
            }
            completion(response, nil)
        }
    }
}
