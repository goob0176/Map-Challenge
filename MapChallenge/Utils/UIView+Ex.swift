//
//  UIView+Ex.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import UIKit


extension UIView {
    static func fromNib(with name: String) -> UIView? {
        UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    static var typeString: String {
        String(describing: Self.self)
    }
}
