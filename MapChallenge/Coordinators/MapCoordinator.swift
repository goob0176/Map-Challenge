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
    
    func goToCoordinates(receivedFrom model: PlaceWeatherModel) {
        guard let lat = model.coord?.lat,
              let lon = model.coord?.lon else {
            presentError(with: Localization.invalidServerModelError)
            return
        }
        let annotation = MKPointAnnotation()
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        annotation.coordinate = coordinate
        mapView.setCenter(coordinate, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    func presentError(with description: String?) {
        mapView.removeAnnotations(mapView.annotations)
        let alert = AlertPresenter.baseAlert(with: Localization.generalAlertTitle, message: description)
        sourceViewController.present(alert, animated: true)
    }
}
