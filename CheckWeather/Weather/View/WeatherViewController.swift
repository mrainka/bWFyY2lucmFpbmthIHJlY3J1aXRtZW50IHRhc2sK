//
//  WeatherViewController.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

final class WeatherViewController: CustomViewController<WeatherView> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model?.fetchData()
    }
}

extension WeatherViewController: ConfigurableWithModel {}
