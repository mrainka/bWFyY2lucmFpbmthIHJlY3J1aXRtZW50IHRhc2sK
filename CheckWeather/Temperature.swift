//
//  Temperature.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct Temperature {

    let feelsLike: Double

    let max: Double
    let min: Double

    let value: Double
}

extension Temperature: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.weatherMainContainer()

        feelsLike = try container.decode(Double.self, forKey: .feelsLike)

        max = try container.decode(Double.self, forKey: .max)
        min = try container.decode(Double.self, forKey: .min)

        value = try container.decode(Double.self, forKey: .value)
    }
}
