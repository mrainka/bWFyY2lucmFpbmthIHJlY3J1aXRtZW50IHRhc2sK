//
//  CityListViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct CityListViewModel {

    let cities: [CityViewModel]

    let unit: UnitViewModel

    init(_ cities: [City] = Cities.examples, unitRepository: AnyRepository<Unit>) {
        self.cities = cities.map(CityViewModel.init)
        unit = .init(repository: unitRepository)
    }
}
