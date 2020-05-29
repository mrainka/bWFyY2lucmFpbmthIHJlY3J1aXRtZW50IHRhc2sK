//
//  WeatherMainContainerGetting.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

extension Decoder {

    func weatherMainContainer() throws -> KeyedDecodingContainer<WeatherCodingKeys.Main> {
        try container(keyedBy: WeatherCodingKeys.self)
            .nestedContainer(keyedBy: WeatherCodingKeys.Main.self, forKey: .main)
    }
}
