//
//  AnnotationViewModel.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation

struct AnnotationViewModel {
    let weatherViewModel: PlaceWeatherModel
    let onItemTapped: (()->Void)?
}
