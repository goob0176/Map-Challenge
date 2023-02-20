//
//  BasePinAnnotation.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import MapKit

final class BasePinAnnotation: MKPointAnnotation, PinAnnotation {
    let annotationViewModel: AnnotationViewModel
    let reuseId: String
    
    init(annotationViewModel: AnnotationViewModel, reuseId: String) {
        self.annotationViewModel = annotationViewModel
        self.reuseId = reuseId
    }
}
