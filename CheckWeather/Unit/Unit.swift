//
//  Unit.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

enum Unit: Int16, CaseIterable {

    case celsius, fahrenheit, kelvin

    var name: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }

    var urlParameter: String? {
        switch self {
        case .celsius:
            return "metric"
        case .fahrenheit:
            return "imperial"
        case .kelvin:
            return nil
        }
    }
}
