//
//  State.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/17/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

struct State: StateType {
    let regionList: RegionList?
}

// MARK: - Protocol conformance

// MARK: CustomStringConvertible

extension State: CustomStringConvertible {
    
    var description: String {
        return """
        regions: \(regionList?.description ?? [].description)
        """
    }
    
}

// MARK: Equatable

func ==(lhs: State, rhs: State) -> Bool {
    return lhs.regionList == rhs.regionList
}

extension State: Equatable { }
