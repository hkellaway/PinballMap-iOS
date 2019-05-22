//
//  MVVMMachinesViewModel.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/22/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class MachinesViewModel {
    
    // Dependencies
    
    weak var view: MVVMMachinesViewController?
    let httpClient: HTTPClient
    
    // State
    
    var machines: [Machine] = []
    
    // MARK: -
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func load(forRegion region: Region) {
        httpClient.getMachines(inRegion: region) { [weak self] result in
            switch result {
            case .success(let machineList):
                self?.machines = machineList.alphabetized
                self?.view?.didLoadMachines()
            case .failure(let error):
                self?.view?.errorOccurred(error)
            }
        }
    }
    
}