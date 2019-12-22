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
    case jsonSerialization
    case casting
    case networkingError
}
