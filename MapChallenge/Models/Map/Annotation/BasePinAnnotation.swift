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
    let shouldHaveCallout: Bool
    
    init(
        annotationViewModel: AnnotationViewModel,
        reuseId: String,
        shouldHaveCallout: Bool 
    ) {
        self.annotationViewModel = annotationViewModel
        self.reuseId = reuseId
        self.shouldHaveCallout = shouldHaveCallout
    }
}
