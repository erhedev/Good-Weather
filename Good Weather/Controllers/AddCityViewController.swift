//
//  AddCityViewController.swift
//  Good Weather
//
//  Created by Erik Hede on 13/03/2019.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true;
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityTextField: BindingTextField! {
        didSet {
            cityTextField.bind{ self.addCityViewModel.city = $0 }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind{ self.addCityViewModel.state = $0 }
        }
    }
    @IBOutlet weak var zipTextField: BindingTextField! {
        didSet {
            zipTextField.bind { self.addCityViewModel.zipCode = $0 }
        }
    }
    
    @IBAction func saveCityButtonPressed() {
        
        print(self.addCityViewModel)
        
        if let city = cityTextField.text, let unit = UserDefaults.standard.value(forKey: "unit") as? String, let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=990aa7359c733eadad8a9df9a0b64693&units=\(unit)")  {
        
            let weatherURL = url
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let wVModel = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return wVModel
            }
            Webservice().load(resource: weatherResource) {[weak self] result in
                
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
                
            }
            
        }
        
    }
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
   
    
}
