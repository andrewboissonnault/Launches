//
//  MissionTableViewCell.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class MissionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel : MissionViewModel! {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func updateViews() {
        self.descriptionLabel.attributedText = viewModel.description
    }
}
