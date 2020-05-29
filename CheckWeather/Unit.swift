//
//  Unit.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

enum Unit {

    case celsius, fahrenheit, kelvin

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
