//
//  UnitViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct UnitViewModel {

    private let repository: AnyRepository<Unit>

    let units = Unit.allCases.map { $0.name }

    init(repository: AnyRepository<Unit>) {
        self.repository = repository
    }

    func selected(_ unit: String) {
        guard let unit = (Unit.allCases.first { $0.name == unit }) else { return }
        repository.update(unit)
    }
}
