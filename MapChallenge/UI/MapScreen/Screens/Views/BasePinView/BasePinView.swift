//
//  BasePinView.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import UIKit
import MapKit

final class BasePinView: UIView, PinView {
    @IBOutlet
    private weak var weatherLabel: UILabel!
    
    static let kCornerRadius = 12.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = Self.kCornerRadius
    }
    
    func setup(with model: PlaceWeatherModel) {
        guard let temp = model.main?.temp else {
            return
        }
        weatherLabel.text = "\(Int(temp))°"
    }
}
