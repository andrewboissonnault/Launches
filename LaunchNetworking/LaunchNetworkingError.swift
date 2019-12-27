//
//  NetworkManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

@objc enum LaunchNetworkingError : Int, Error {
    case missingData
    case networkingError
    
    var localizedDescription: String {
        switch self {
        case .missingData:
            return "Missing data in response body."
        case .networkingError:
            return "Networking error."
        }
    }
}
