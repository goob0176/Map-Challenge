//
//  BasePinView.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import UIKit
import MapKit

private struct Constants {
    static let cornerRadius = 12.0
    static let labelMinimumScaleFactor = 0.7
    static let containerViewSide = 50.0
}

final class BasePinView: MKAnnotationView {
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.minimumScaleFactor = Constants.labelMinimumScaleFactor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Constants.containerViewSide, height: Constants.containerViewSide))
        view.backgroundColor = .blue
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
        canShowCallout = true
        detailCalloutAccessoryView = calloutButton
        
        addSubview(containerView)
        containerView.addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            weatherLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            weatherLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

}

extension BasePinView: PinView {
    func setup(with model: AnnotationViewModel, and pinAnnotation: PinAnnotation) {
        weatherLabel.text = model.value
        onItemTapped = model.onItemTapped
        annotation = pinAnnotation as? MKAnnotation
    }
}
