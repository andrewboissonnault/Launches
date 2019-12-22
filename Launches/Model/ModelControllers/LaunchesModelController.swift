//
//  LaunchModelController.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

protocol ModelControllerObserver: AnyObject {
    func modelControllerDidUpdate(_ controller: LaunchesModelController)
}

class LaunchesModelController {
    
    private let api : LaunchAPI
    private var observations = [ObjectIdentifier : Observation]()
    var launches : [Launch]? {
        didSet {
            notifyObservers()
        }
    }
    
    init(api : LaunchAPI = LaunchAPI()) {
        self.api = api
    }
    
    func refresh() {
        self.api.fetchLaunches { (response, error) in
            self.launches = response?.launches
        }
    }
}

extension LaunchesModelController {
    func addObserver(_ observer: ModelControllerObserver) {
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }

    func removeObserver(_ observer: ModelControllerObserver) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }
    
    func notifyObservers() {
        for (id, observation) in observations {
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            observer.modelControllerDidUpdate(self)
        }
    }
}

private extension LaunchesModelController {
    struct Observation {
        weak var observer: ModelControllerObserver?
    }
}
