//
//  NetworkSpecification.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

protocol NetworkSpecification: Specification {

    var apiRoute: APIRoute { get }
}
