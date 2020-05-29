//
//  WeatherCodingKeys.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

enum WeatherCodingKeys: String, CodingKey {

    enum Main: String, CodingKey {

        case feelsLike = "feels_like"

        case max = "temp_max"
        case min = "temp_min"

        case pressure

        case value = "temp"
    }

    case main
}
