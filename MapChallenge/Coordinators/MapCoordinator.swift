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
    
    private static let kLineBreakSeparator = "\n"
    
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
            value: model.infoValue,
            annotationReuseId: BasePinView.typeString,
            shouldCenterTheScreenAroundCoordinate: true,
            shouldHaveCallout: true,
            onItemTapped: onItemTapped
        )
    }
    
    func placeSideLocationsMarkers(on models: [PlaceWeatherModel]) {
        models.forEach { model in
            addAnnotation(
                for: model.coord,
                value: model.infoValue,
                annotationReuseId: BasePinView.typeString
            )
        }
    }
    
    func presentError(with description: String?) {
        mapView.removeAnnotations(mapView.annotations)
        let alert = AlertPresenter.baseAlert(with: Localization.generalAlertTitle, message: description)
        sourceViewController.present(alert, animated: true)
    }
    
    func presentAreaDetailsAlert(with models: [AreaDetailMode]) {
        let descriptionString = models
            .map { $0.valueStirng }
            .joined(separator: Self.kLineBreakSeparator)
        
        let alert = AlertPresenter.baseAlert(with: Localization.areaDetailsAlertTitle, message: descriptionString)
        sourceViewController.present(alert, animated: true)
    }
}

private extension MapCoordinator {
    func addAnnotation(
        for coordinatesModel: WeatherCoordinationsModel?,
        value: String,
        annotationReuseId: String,
        shouldCenterTheScreenAroundCoordinate: Bool = false,
        shouldHaveCallout: Bool = false,
        onItemTapped: (()->Void)? = nil
    ) {
        guard let lat = coordinatesModel?.lat,
              let lon = coordinatesModel?.lon else {
            presentError(with: Localization.invalidServerModelError)
            return
        }
        
        let annotationViewModel = AnnotationViewModel(value: value, onItemTapped: onItemTapped)
        let annotation = BasePinAnnotation(
            annotationViewModel: annotationViewModel,
            reuseId: annotationReuseId,
            shouldHaveCallout: shouldHaveCallout
        )
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        if shouldCenterTheScreenAroundCoordinate {
            mapView.setCenter(coordinate, animated: true)
        }
    }
}
