//
//  MissionContainerView.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class MissionContainerView : UIView {
    
    override var intrinsicContentSize: CGSize {
        guard let tableView = subviews.first else {
            return CGSize.zero
        }
        return tableView.intrinsicContentSize
    }
}
