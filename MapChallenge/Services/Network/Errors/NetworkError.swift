//
//  NetworkError.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

enum NetworkError: Equatable {
    case invalidUrl
    case serverError
    case dataReceivingError(description: String)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return Localization.invalidUrlErrorMsg
        case .serverError:
            return Localization.serverErrorMsg
        case .dataReceivingError(let description):
            return description
        }
    }
}
