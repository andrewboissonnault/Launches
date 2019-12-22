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
    
    var viewModel : LaunchCellViewModel! {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func updateViews() {
        self.name.text = viewModel.name
        self.launchTime.text = viewModel.launch
        self.missionCount.text = viewModel.mission
    }

}
