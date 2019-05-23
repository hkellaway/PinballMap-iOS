//
//  Session.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

final class Session {
    
    static var shared = Session()
    
    var selectedRegion: Region?
    var selectedLocation: Location?
    var selectedMachine: Machine?
    
    func clear() {
        selectedRegion = nil
        selectedLocation = nil
        selectedMachine = nil
    }
    
}
