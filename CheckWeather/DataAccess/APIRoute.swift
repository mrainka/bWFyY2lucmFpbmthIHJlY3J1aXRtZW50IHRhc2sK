//
//  APIRoute.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Alamofire
import Foundation

enum APIRoute {

    case weather(cityID: Int, units: Unit)

    private var parameters: Parameters {
        var parameters = Parameters()

        switch self {
        case .weather(let cityID, let units):
            parameters["id"] = cityID

            if let units = units.urlParameter {
                parameters["units"] = units
            }
        }

        parameters["appid"] = "d4b550d742c5208ad57a65cb682164d3"

        return parameters
    }
}

extension APIRoute: URLRequestConvertible {

    func asURLRequest() throws -> URLRequest {
        try URLEncoding.default.encode(
            URLRequest(url: "https://api.openweathermap.org/data/2.5/weather".asURL()),
            with: parameters)
    }
}
