//
//  MapCoordinator.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import UIKit
import MapKit

struct MapCoordinator: MapCoordinatorType {
    private let sourceViewController: UIViewController
    private let mapView: MKMapView
    
    init(
        sourceViewController: UIViewController,
        mapView: MKMapView
    ) {
        self.sourceViewController = sourceViewController
        self.mapView = mapView
    }
    
    func goToCoordinates(receivedFrom model: PlaceWeatherModel, onItemTapped: @escaping ()->Void) {
        mapView.removeAnnotations(mapView.annotations)
        addAnnotation(
            for: model.coord,
            value: model.tempValue,
            annotationReuseId: BasePinView.typeString,
            onItemTapped: onItemTapped
        )
    }
    
    func placeSideLocationsMarkers(on models: [MapWeatherModel]) {
        models.forEach { model in
            addAnnotation(
                for: model.coordinates,
                value: model.valueStirng,
                annotationReuseId: SideLocationView.typeString
            )
        }
    }
    
    func presentError(with description: String?) {
        mapView.removeAnnotations(mapView.annotations)
        let alert = AlertPresenter.baseAlert(with: Localization.generalAlertTitle, message: description)
        sourceViewController.present(alert, animated: true)
    }
}

private extension MapCoordinator {
    func addAnnotation(
        for coordinatesModel: WeatherCoordinationsModel?,
        value: String,
        annotationReuseId: String,
        onItemTapped: (()->Void)? = nil
    ) {
        guard let lat = coordinatesModel?.lat,
              let lon = coordinatesModel?.lon else {
            presentError(with: Localization.invalidServerModelError)
            return
        }
        
        let annotationViewModel = AnnotationViewModel(value: value, onItemTapped: onItemTapped)
        let annotation = BasePinAnnotation(annotationViewModel: annotationViewModel, reuseId: annotationReuseId)
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        annotation.coordinate = coordinate
        mapView.setCenter(coordinate, animated: true)
        mapView.addAnnotation(annotation)
    }
}
