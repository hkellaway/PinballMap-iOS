//
//  ReduxLocationsViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxLocationsViewController: LocationsViewController, StoreSubscriber {
    
    var apiActions: APIActions!
    var navigator: Navigator!
    
    private var locations: [Location] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        store.dispatch(apiActions.loadLocations)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        guard let locationList = state.locationList else {
            self.locations = []
            tableView.reloadData()
            return
        }
        
        switch locationList {
        case .loading:
            view.showActivityIndicator()
        case .loaded(let locationList):
            view.hideActivityIndicator()
            self.locations = locationList.alphabetized
            tableView.reloadData()
        case .errored(let error):
            view.hideActivityIndicator()
            displayError(error)
        }
    }
    
}

// MARK: - Protocol conformance

// MARK: UITableViewDataSource

extension ReduxLocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let location = locations[indexPath.row]
        cell.textLabel?.text = "\(location.name) (\(location.numMachines))"
        return cell
    }
    
}

// MARK: UITableViewDataSource

extension ReduxLocationsViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        cell.isSelected = store.state.selectedLocation == location
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        navigator.navigateToLocationDetail(forLocation: location)
    }
    
}
