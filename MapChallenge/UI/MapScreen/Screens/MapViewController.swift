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
    
    private let viewModel: MapScreenViewModelType = MapScreenViewModel()
    private var coordinator: MapCoordinatorType {
        MapCoordinator(sourceViewController: self, mapView: mapView)
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
    }
}

// MARK: - UISearchBarDelegate

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        viewModel.getWeather(for: text) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let model):
                    self?.coordinator.goToCoordinates(receivedFrom: model)
                case .failure(let error):
                    self?.coordinator.presentError(with: error.localizedDescription)
                }
            }
        }
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
            let pinView = UIView.fromNib(with: baseAnnotation.reuseId) as? PinView
            pinView?.setup(with: baseAnnotation.weatherModel)
            annotationView.addSubview(pinView as? UIView ?? UIView())
        }
        return annotationView
    }
}

