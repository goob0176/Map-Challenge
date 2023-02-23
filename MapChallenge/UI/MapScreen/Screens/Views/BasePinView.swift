//
//  BasePinView.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import UIKit
import MapKit

// MARK: - Constants

private struct Constants {
    static let cornerRadius = 12.0
    static let labelMinimumScaleFactor = 0.7
    static let sideOffset = 16.0
    static let containerViewFrame = CGRect(x: 0, y: 0, width: 200.0, height: 120.0)
}

// MARK: - BasePinView

final class BasePinView: MKAnnotationView {
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = Constants.labelMinimumScaleFactor
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: Constants.containerViewFrame)
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var calloutButton: UIButton = {
        UIButton(type: .detailDisclosure, primaryAction: UIAction(handler: { [weak self] _ in
            self?.onItemTapped?()
        }))
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var onItemTapped: (()->Void)?
    
    private func setupView() {
        
        addSubview(containerView)
        containerView.addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            weatherLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            weatherLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.sideOffset),
            weatherLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.sideOffset)
        ])
    }

}

// MARK: - PinView conformance

extension BasePinView: PinView {
    func setup(with model: AnnotationViewModel, and pinAnnotation: PinAnnotation) {
        weatherLabel.text = model.value
        onItemTapped = model.onItemTapped
        annotation = pinAnnotation as? MKAnnotation
        
        if pinAnnotation.shouldHaveCallout {
            canShowCallout = true
            detailCalloutAccessoryView = calloutButton
        }
    }
}
