//
//  ViewController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/19/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

class LaunchListViewController: UITableViewController {
    
    var modelController : LaunchesModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDependencies()
        setupRefresh()
        tableView.isHidden = true
        refreshLaunches()
    }
    
    private func setupDependencies() {
        modelController = LaunchesModelController()
        modelController.addObserver(self)
    }
    
    private func setupRefresh() {
        self.refreshControl = UIRefreshControl()
        self.tableView.refreshControl = refreshControl
        refreshControl?.addTarget(self, action: #selector(refreshLaunches), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func refreshLaunches() {
        modelController.refresh { (response, error) in
            if let safeError = error {
                self.handleError(safeError)
            }
            self.refreshControl?.endRefreshing()
        }
    }
    
    private func showLaunchDetails(_ launch : Launch) {
        let vc = UIStoryboard.launchDetailsVC(launch)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LaunchListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelController.launches?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(identifier: .LaunchCell, for: indexPath)
        guard let launchCell = cell as? LaunchTableViewCell else {
            fatalError("Error casting cell into LaunchTableViewCell")
        }
        guard let launches = self.modelController.launches else {
            fatalError("Expected non nil launches object.")
        }
        let launch = launches[indexPath.row]
        launchCell.viewModel = LaunchViewModel(launch)
        return launchCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let launches = self.modelController.launches else {
            fatalError("Expected non nil launches object.")
        }
        let launch = launches[indexPath.row]
        showLaunchDetails(launch)
    }
}

extension LaunchListViewController : ModelControllerObserver {
    func modelControllerDidUpdate(_ controller: LaunchesModelController) {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
}

extension UIViewController {
    func handleError(_ error : Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
             self.present(alert, animated: true, completion: nil)
        }
    }
}
