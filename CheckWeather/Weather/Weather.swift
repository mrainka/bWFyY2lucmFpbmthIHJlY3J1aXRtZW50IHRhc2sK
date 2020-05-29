//
//  Weather.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct Weather {

    let pressure: Double
    let temperature: Temperature
}

extension Weather: Decodable {

    init(from decoder: Decoder) throws {
        pressure = try decoder.weatherMainContainer().decode(Double.self, forKey: .pressure)
        temperature = try .init(from: decoder)
    }
}
