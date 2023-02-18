//
//  ViewController.swift
//  MapChallenge
//
//  Created by Andrey Khlopotin on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherRepository().fetchWeather(for: "London") { result in
            debugPrint(result)
        }
    }
}

