//
//  MocksDictionaries.swift
//  MapChallengeTests
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import Foundation

struct MocksDictionariesFactory {
    static let rainModel =
    """
    {
        "1h": 3.51
    }
    """
    
    static let windModel =
    """
    {
        "speed": 0.62
    }
    """
    
    static let weatherCoordinates =
    """
    {
        "lon": 10.99,
        "lat": 44.34
    }
    """
    
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
      "coord": {
        "lon": 10.99,
        "lat": 44.34
    },
      "main" : {
         "temp" : 20.0,
         "humidity" : 5
    },
      "wind": {
        "speed": 0.62,
    },
      "rain": {
        "1h": 3.51
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
