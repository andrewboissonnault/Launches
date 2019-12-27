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
    @IBOutlet weak var agencyTextView: UITextView!
    @IBOutlet weak var locationTextView: NewLineTextView!
    @IBOutlet weak var rocketTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupViews() {
        let basicInfo = launchModelController.launchViewModel
        name.attributedText = basicInfo.name
        launchTime.text = basicInfo.launch
        if let url = basicInfo.rocketshipImageUrl {
            rocketshipIcon.setImageFromURL(url)
        }
        else {
            self.rocketshipIcon.image = nil
        }
        self.missionCount.text = basicInfo.mission
        self.agencyTextView.attributedText = launchModelController.agencyViewModel.text
        self.locationTextView.attributedText = launchModelController.locationViewModel.text
        self.rocketTextView.attributedText = launchModelController.rocketViewModel.text
        self.locationTextView.translatesAutoresizingMaskIntoConstraints = false
        rocketTextView.translatesAutoresizingMaskIntoConstraints = false
        agencyTextView.translatesAutoresizingMaskIntoConstraints = false
        self.agencyTextView.sizeToFit()
        self.locationTextView.sizeToFit()
        self.rocketTextView.sizeToFit()
        self.view.setNeedsDisplay()
        self.view.setNeedsLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let childViewController = segue.destination as? MissionsViewController {
            childViewController.view.translatesAutoresizingMaskIntoConstraints = false
            childViewController.viewModel = self.launchModelController.missionsViewModel
        }
    }
}
