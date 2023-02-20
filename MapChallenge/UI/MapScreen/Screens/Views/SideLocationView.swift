//
//  SideLocationView.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 20.02.2023.
//

import UIKit
import MapKit

private struct Constants {
    static let cornerRadius = 12.0
    static let labelMinimumScaleFactor = 0.5
    static let containerViewFrame = CGRect(x: 0, y: 0, width: 200.0, height: 50.0)
}

class SideLocationView: MKAnnotationView {
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = Constants.labelMinimumScaleFactor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: Constants.containerViewFrame)
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        canShowCallout = false
        
        addSubview(containerView)
        containerView.addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            weatherLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            weatherLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            weatherLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
}

extension SideLocationView: PinView {
    func setup(with model: AnnotationViewModel, and pinAnnotation: PinAnnotation) {
        annotation = pinAnnotation as? MKAnnotation
        weatherLabel.text = model.value
    }
}
