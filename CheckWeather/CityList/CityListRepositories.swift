//
//  CityListRepositories.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct CityListRepositories {

    let unit: AnyRepository<Unit>
    let weather: WeatherRepositories

    init(_ repositories: Repositories) {
        unit = repositories.unit
        weather = .init(unit: repositories.unit, weather: repositories.weather)
    }
}
