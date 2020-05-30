//
//  CityListViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

final class CityListViewModel {

    let cities: [CityViewModel]
    private let models: [City]

    let unit: UnitViewModel

    var onOpenWeather: ((WeatherViewModel) -> Void)?

    private let weatherRepositories: WeatherRepositories

    init(_ cities: [City] = Cities.examples, repositories: CityListRepositories) {
        self.cities = cities.map(CityViewModel.init)
        models = cities

        unit = .init(repository: repositories.unit)

        weatherRepositories = repositories.weather
    }

    func selected(index: Int) {
        guard models.indices.contains(index) else { return }
        onOpenWeather?(.init(cityID: models[index].id, repositories: weatherRepositories))
    }
}
