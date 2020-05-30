//
//  UnitViewModelTests.swift
//  CheckWeatherTests
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

@testable import CheckWeather
import Nimble
import XCTest

final class UnitViewModelTests: XCTestCase {

    func testShouldNotUpdateUnitWhenNameDoesNotExists() throws {
        let repository = RepositoryMock<CheckWeather.Unit>()
        UnitViewModel(repository: .init(repository)).selected("non-existent")
        expect(repository.updateWasCalled).to(beFalse())
    }

    func testShouldUpdateUnitWhenNameExists() throws {
        let repository = RepositoryMock<CheckWeather.Unit>()
        UnitViewModel(repository: .init(repository)).selected(Unit.celsius.name)
        expect(repository.updateWasCalled).to(beTrue())
    }
}
