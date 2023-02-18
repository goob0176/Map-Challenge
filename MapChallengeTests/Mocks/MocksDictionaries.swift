//
//  MocksDictionaries.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct MocksDictionariesFactory {
    static let geolocationsArray =
    """
    [
        {
            "name" : "London",
            "lat" : 42.9834,
            "lon" : -81.233,
        }
    ]
    """
    
    static let geolocationModel =
    """
    {
        "name" : "London",
        "lat" : 42.9834,
        "lon" : -81.233,
    }
    """
    
    static let placeWeatherModel =
    """
    {
      "main" : {
         "temp" : 20.0,
         "humidity" : 5
        }
    }
    """
    
    static let mainWeatherModel =
    """
    {
        "temp" : 20.0,
        "humidity" : 5
    }
    """
}
