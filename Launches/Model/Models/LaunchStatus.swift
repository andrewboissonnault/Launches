//
//  LaunchStatus.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

enum LaunchStatus : Int, Codable, CaseIterable {
    case Green = 1
    case Red
    case Success
    case Failed
}
