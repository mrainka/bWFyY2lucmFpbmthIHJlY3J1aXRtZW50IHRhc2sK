//
//  MaxMinTemperatureViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Foundation

struct MaxMinTemperatureViewModel {

    let max: String
    let min: String

    init(_ temperature: Temperature, format: String) {
        max = "MAX: " + .init(format: format, temperature.max)
        min = "MIN: " + .init(format: format, temperature.min)
    }
}
