//
//  DescriptionConstructor.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 22.02.2023.
//

import Foundation

struct DescriptionConstructor {
    static func formString<T: Equatable>(_ prefix: String, value: T?) -> String {
        guard let value = value else {
            return "\(prefix): -"
        }
        return "\(prefix): \(value)"
    }
}
