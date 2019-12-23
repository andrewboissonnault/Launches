//
//  MissionsViewController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class MissionsViewController: UITableViewController {
    
    var viewModel : MissionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 55
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.missions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MissionCell.rawValue, for: indexPath)
        guard let missionCell = cell as? MissionTableViewCell else {
            fatalError("Error casting cell into MissionTableViewCell")
        }
        let mission = viewModel.missions[indexPath.row]
        missionCell.viewModel = mission
        return missionCell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
