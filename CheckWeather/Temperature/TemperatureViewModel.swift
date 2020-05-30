//
//  TemperatureViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Foundation

struct TemperatureViewModel {

    let feelsLike: String
    let maxMin: MaxMinTemperatureViewModel
    let value: String

    init(_ temperature: Temperature) {
        let format = "%.1f"
        feelsLike = "FEELS LIKE: " + .init(format: format, temperature.feelsLike)
        maxMin = .init(temperature, format: format)
        value = .init(format: format, temperature.value)
    }
}
