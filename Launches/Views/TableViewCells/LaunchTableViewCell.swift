//
//  LaunchTableViewCell.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var launchTime: UILabel!
    @IBOutlet weak var missionCount: UILabel!
    @IBOutlet weak var rocketshipIcon: UIImageView!
    
    var viewModel : LaunchViewModel! {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        self.name.attributedText = viewModel.name
        self.launchTime.text = viewModel.launch
        self.missionCount.text = viewModel.mission
        if let url = viewModel.rocketshipImageUrl {
            self.rocketshipIcon.setImageFromURL(url)
        }
        else {
            self.rocketshipIcon.image = nil
        }
    }
}
