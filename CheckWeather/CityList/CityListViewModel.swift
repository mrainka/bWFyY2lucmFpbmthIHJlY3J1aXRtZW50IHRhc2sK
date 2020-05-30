//
//  CityListViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct CityListViewModel {

    let cities: [CityViewModel]

    init(_ cities: [City] = Cities.examples) {
        self.cities = cities.map(CityViewModel.init)
    }
}
