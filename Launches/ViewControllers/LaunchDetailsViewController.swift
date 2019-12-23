//
//  LaunchDetailsViewController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class LaunchDetailsViewController: UIViewController {
    
    var launchModelController : LaunchModelController!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var launchTime: UILabel!
    @IBOutlet weak var rocketshipIcon: UIImageView!
    @IBOutlet weak var missionCount: UILabel!
    @IBOutlet weak var missionsContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupViews() {
        let basicInfo = launchModelController.launchViewModel.basicInfo
        name.text = basicInfo.name
        launchTime.text = basicInfo.launch
        if let url = basicInfo.rocketshipImageUrl {
            rocketshipIcon.setImageFromURL(url)
        }
        else {
            self.rocketshipIcon.image = nil
        }
        self.missionCount.text = launchModelController.launchViewModel.mission
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let childViewController = segue.destination as? MissionsViewController {
            childViewController.view.translatesAutoresizingMaskIntoConstraints = false
            childViewController.viewModel = self.launchModelController.missionsViewModel
        }
    }

}
