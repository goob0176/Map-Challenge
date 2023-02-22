//
//  RainModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 22.02.2023.
//

import Foundation

struct RainModel: Decodable {
    let rainPerHour: Float?
    
    private enum CodingKeys : String, CodingKey {
        case rainPerHour = "1h"
    }
}
