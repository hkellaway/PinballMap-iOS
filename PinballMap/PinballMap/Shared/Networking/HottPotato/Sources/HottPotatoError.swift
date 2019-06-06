//
//  HottPotatoError.swift
//  HottPotato
//
//  Created by Harlan Kellaway on 5/10/19.
//  Copyright © 2019 Harlan Kellaway. All rights reserved.
//

import Foundation

/// HottPotato error.
///
/// - invalidRequestURL: Could not compose URL for HTTP request.
/// - requestError: Error occurred during HTTP request.
public enum HottPotatoError: Error {
    case invalidRequestURL
    case requestError(value: Error)
}

// MARK: - Protocol conformance

// MARK: Equatable

public func ==(lhs: HottPotatoError, rhs: HottPotatoError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidRequestURL, .invalidRequestURL):
        return true
    case (.requestError(let error1), .requestError(let error2)):
        return error1.localizedDescription == error2.localizedDescription
    default:
        return false
    }
}

extension HottPotatoError: Equatable { }
