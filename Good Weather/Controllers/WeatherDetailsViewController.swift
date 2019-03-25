//
//  WeatherDetailsViewController.swift
//  Good Weather
//
//  Created by Erik Hede on 2019-03-20.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    
    override func viewDidLoad() {
        setupVWBingings()
    
    }
    
    func setupVWBingings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind { self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind { self.currentTemp.text = $0.formatAsDegree }
            
        }
    }
    
    
    
    
    
}
