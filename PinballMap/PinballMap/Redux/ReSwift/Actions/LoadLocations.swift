//
//  LoadLocations.swift
//  PinballMap
//
//  Created by Harlan Kellaway on 5/20/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation
import ReSwift

struct LoadLocations: Action {
    let locationList: APIResponseStatus<LocationList>
}
