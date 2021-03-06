//
//  SettingsViewModel.swift
//  Good Weather
//
//  Created by Erik Hede on 2019-03-19.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

extension Unit {
    var displayNameLowercase: String {
        get {
            switch(self) {
            case .celsius:
                return "celsius"
            case .fahrenheit:
                return "fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    
    let units = Unit.allCases
    
    private var _selectedUnit: Unit = Unit.celsius
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            
            return _selectedUnit
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
    
    
    
    
    
    
    
}
