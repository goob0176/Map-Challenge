//
//  MapViewController.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import UIKit
import MapKit

// MARK: - MapViewController

final class MapViewController: UIViewController {
    @IBOutlet
    private weak var searchBar: UISearchBar!
    @IBOutlet private
    weak var mapView: MKMapView!
    
    private var viewModel: MapScreenViewModelType {
        MapScreenViewModel(coordinator: MapCoordinator(sourceViewController: self, mapView: mapView))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupMapView()
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = Localization.searchBarPlaceholder
        searchBar.delegate = self
    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.register(BasePinView.self, forAnnotationViewWithReuseIdentifier: BasePinView.typeString)
    }
}

// MARK: - UISearchBarDelegate

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        searchBar.resignFirstResponder()
        viewModel.getWeather(for: text)
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let baseAnnotation = annotation as? PinAnnotation else {
            return nil
        }
        var annotationView: MKAnnotationView
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: baseAnnotation.reuseId) {
            annotationView = view
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: baseAnnotation.reuseId)
        }
        let pinView = annotationView as? PinView
        pinView?.setup(with: baseAnnotation.annotationViewModel, and: baseAnnotation)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        guard let view = views.first as? BasePinView,
              let annotation = view.annotation,
              let pinAnnotation = view.annotation as? PinAnnotation,
              pinAnnotation.shouldHaveCallout else {
            return
        }
        mapView.selectAnnotation(annotation, animated: false)
    }
}

