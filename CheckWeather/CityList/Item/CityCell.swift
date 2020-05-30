//
//  CityCell.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import UIKit

final class CityCell: UITableViewCell {

    private(set) var model: CityViewModel?
}

extension CityCell: ConfigurableWithModel {

    func configure(with model: CityViewModel) {
        self.model = model
        textLabel?.text = model.text
    }
}
