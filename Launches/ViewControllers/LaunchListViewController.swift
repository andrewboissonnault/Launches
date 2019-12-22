//
//  ViewController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class LaunchListViewController: UITableViewController, ModelControllerObserver {
    
    var modelController : LaunchesModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDependencies()
    }
    
    private func setupDependencies() {
        modelController = LaunchesModelController()
        modelController.addObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modelController.refresh()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelController.launches?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.LaunchCell.rawValue, for: indexPath)
        guard let launchCell = cell as? LaunchTableViewCell else {
            fatalError("Error casting cell into LaunchTableViewCell")
        }
        guard let launches = self.modelController.launches else {
            fatalError("Expected non nil launches object.")
        }
        let launch = launches[indexPath.row]
        launchCell.viewModel = LaunchCellViewModel(launch : launch)
        return cell
    }
    
    func modelControllerDidUpdate(_ controller: LaunchesModelController) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

