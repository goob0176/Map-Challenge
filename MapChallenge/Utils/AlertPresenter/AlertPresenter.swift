//
//  AlertPresenter.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 19.02.2023.
//

import Foundation
import UIKit

struct AlertPresenter {
    static func baseAlert(with title: String?, message: String?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Localization.generalAlertButtonTitle, style: .cancel))
        
        return alertController
    }
}
