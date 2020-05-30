//
//  RepositoryMock.swift
//  CheckWeatherTests
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

@testable import CheckWeather

final class RepositoryMock<Item> {

    var queryWasCalled = false
    var updateWasCalled = false

    var onQuery: ((Specification, @escaping (Result<Item, RepositoryError>) -> Void) -> Void)?
    var onUpdate: ((Item) -> Void)?
}

extension RepositoryMock: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void) {
        queryWasCalled = true
        onQuery?(specification, completion)
    }

    func update(_ item: Item) {
        updateWasCalled = true
        onUpdate?(item)
    }
}
