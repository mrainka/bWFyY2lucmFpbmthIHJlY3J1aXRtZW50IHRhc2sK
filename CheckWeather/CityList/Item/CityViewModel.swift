//
//  CityViewModel.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct CityViewModel {

    static let cellReuseIdentifier = "CityCell"

    let text: String

    init(_ city: City) {
        text = city.name
    }
}

extension CityViewModel: CellReusable {}
