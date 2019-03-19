//
//  Double+Extensions.swift
//  Good Weather
//
//  Created by Erik Hede on 2019-03-19.
//  Copyright © 2019 Erik Hede. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
