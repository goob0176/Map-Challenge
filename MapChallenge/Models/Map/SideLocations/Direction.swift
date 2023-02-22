//
//  Direction.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 22.02.2023.
//

import Foundation

enum Direction: String, CaseIterable {
    case north
    case east
    case south
    case west
}

extension Direction {
    var bearingDegree: Double {
        switch self {
        case .north:
            return 0.0
        case .east:
            return 0.5 * Double.pi
        case .south:
            return Double.pi
        case .west:
            return 1.5 * Double.pi
        }
    }
}
