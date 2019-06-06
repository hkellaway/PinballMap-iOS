//
//  Data.swift
//  PinballMapSwiftUI
//
//  Created by Harlan Kellaway on 6/5/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

let mockRegionList: RegionList = load("MockRegionList.json")
let mockLocationList = LocationList(locations: [
    Location(id: 1, name: "Empire State Building", street: "34th St Herald Sq", locationMachineXrefs: [
        Location.MachineXRef(machineId: 123)
        ]),
    Location(id: 1, name: "Location 2", street: "123 ABC St", locationMachineXrefs: [
        Location.MachineXRef(machineId: 234)
        ])
    ]
)

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

