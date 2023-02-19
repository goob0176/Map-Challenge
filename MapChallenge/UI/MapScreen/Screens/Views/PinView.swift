//
//  PinView.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation

protocol PinView: AnyObject {
    func setup(with model: PlaceWeatherModel)
}
