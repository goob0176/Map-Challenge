//
//  MapViewController.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import UIKit
import MapKit

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
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = Localization.searchBarPlaceholder
        searchBar.delegate = self
    }
}

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

