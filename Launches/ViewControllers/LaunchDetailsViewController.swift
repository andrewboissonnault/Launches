//
//  LaunchDetailsViewController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class LaunchDetailsViewController: UIViewController {
    
    var launch : Launch!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var launchTime: UILabel!
    @IBOutlet weak var rocketshipIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let basicInfo = LaunchBasicInfo.init(launch)
        name.text = basicInfo.name
        launchTime.text = basicInfo.launch
        if let url = basicInfo.rocketshipImageUrl {
            rocketshipIcon.setImageFromURL(url)
        }
        else {
            self.rocketshipIcon.image = nil
        }
    }

}
