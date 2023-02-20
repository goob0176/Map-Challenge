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
        addAnnotation(from: model, annotationReuseId: BasePinView.typeString, onItemTapped: onItemTapped)
    }
    
    func placeSideLocationsMarkers(on models: [PlaceWeatherModel]) {
        models.forEach { model in
            addAnnotation(from: model, annotationReuseId: BasePinView.typeString)
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
        from model: PlaceWeatherModel,
        annotationReuseId: String,
        onItemTapped: (()->Void)? = nil
    ) {
        guard let lat = model.coord?.lat,
              let lon = model.coord?.lon else {
            presentError(with: Localization.invalidServerModelError)
            return
        }
        
        let annotationViewModel = AnnotationViewModel(weatherViewModel: model, onItemTapped: onItemTapped)
        let annotation = BasePinAnnotation(annotationViewModel: annotationViewModel, reuseId: annotationReuseId)
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        annotation.coordinate = coordinate
        mapView.setCenter(coordinate, animated: true)
        mapView.addAnnotation(annotation)
    }
}
