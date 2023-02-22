//
//  Localization.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct Localization {
    static let invalidUrlErrorMsg = "INVALID_URL_ERROR_MSG".localized
    static let serverErrorMsg = "SERVER_ERROR_MSG".localized
    static let searchBarPlaceholder = "SEARCH_BAR_PLACEHOLDER".localized
    static let generalAlertTitle = "GENERAL_ALERT_TITLE".localized
    static let invalidServerModelError = "INVALID_SERVER_MODEL_ERROR".localized
    static let generalAlertButtonTitle = "GENERAL_ALERT_BUTTON_TITLE".localized
    static let hottestTempMessage = "HOTTEST_TEMP_MESSAGE".localized
    static let mostHumidityMessage = "MOST_HUMIDITY_MESSAGE".localized
    static let areaDetailsAlertTitle = "AREA_DETAILS_ALERT_TITLE".localized
}

private extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
