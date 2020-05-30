//
//  WeatherViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import RxCocoa

final class WeatherViewModel {

    private let cityID: Int

    let pressure: BehaviorRelay<String?> = .init(value: nil)
    let temperature: BehaviorRelay<TemperatureViewModel?> = .init(value: nil)

    private let repositories: WeatherRepositories

    init(cityID: Int, repositories: WeatherRepositories) {
        self.cityID = cityID
        self.repositories = repositories
    }

    func fetchData() {
        repositories.unit.query(UnitSpecification()) { [weak self] in
            guard let `self` = self else { return }

            let unit = (try? $0.get()) ?? .celsius

            self.repositories.weather.query(WeatherSpecification(cityID: self.cityID, units: unit)) { [weak self] in
                guard let `self` = self, let weather = try? $0.get() else { return }

                self.pressure.accept("PRESSURE: \(weather.pressure)")
                self.temperature.accept(.init(weather.temperature))
            }
        }
    }
}
