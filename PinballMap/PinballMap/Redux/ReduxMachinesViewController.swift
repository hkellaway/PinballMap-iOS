//
//  ReduxMachinesViewController.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import ReSwift
import UIKit

final class ReduxMachinesViewController: MachinesViewController, StoreSubscriber {
    
    let store: Store<State>
    let navigator: Navigator
    
    private var machines: [Machine] = []
    
    init(store: Store<State>, navigator: Navigator) {
        self.store = store
        self.navigator = navigator
        
        super.init(nibName: nil, bundle: nil)
        
        store.subscribe(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    deinit {
        store.unsubscribe(self)
    }
    
    // MARK: - Protocol conformance
    
    // MARK: StoreSubscriber
    
    func newState(state: State) {
        updateTitle(withRegion: state.selectedRegion)
        self.machines = state.machineList?.alphabetized ?? []
        navigator.setTabBadge(tab: .machines, value: state.machineList?.count ?? 0)
        tableView.reloadData()
    }
    
}

// MARK: - Protocol conformance

extension ReduxMachinesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let machine = machines[indexPath.row]
        cell.textLabel?.text = machine.name
        return cell
    }
    
}
