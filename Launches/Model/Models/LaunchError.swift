//
//  NetworkManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

enum LaunchError : Error {
    case missingData
    case decodingError
    
    var localizedDescription: String {
        switch self {
            case .missingData:
                return "Missing data in response body."
            case .decodingError:
                return "Error decoding response into models objects."
            }
        }
    }

