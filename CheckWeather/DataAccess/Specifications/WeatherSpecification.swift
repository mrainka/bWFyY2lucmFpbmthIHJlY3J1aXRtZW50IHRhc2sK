//
//  WeatherSpecification.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct WeatherSpecification {

    let apiRoute: APIRoute

    init(cityID: Int, units: Unit) {
        apiRoute = .weather(cityID: cityID, units: units)
    }
}

extension WeatherSpecification: NetworkSpecification {}
