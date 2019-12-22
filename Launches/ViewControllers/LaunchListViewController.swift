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
        
        self.refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl?.addTarget(self, action: #selector(refreshLaunches), for: .valueChanged)
        refreshLaunches()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func refreshLaunches() {
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
        launchCell.viewModel = LaunchCellViewModel(launch)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let launches = self.modelController.launches else {
            fatalError("Expected non nil launches object.")
        }
        let launch = launches[indexPath.row]
        showLaunchDetails(launch)
    }
    
    private func showLaunchDetails(_ launch : Launch) {
        let vc = UIStoryboard.launchDetailsVC(launch)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func modelControllerDidUpdate(_ controller: LaunchesModelController) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
}

