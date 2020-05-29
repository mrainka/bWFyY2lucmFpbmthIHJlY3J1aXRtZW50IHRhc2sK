//
//  Repository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

protocol Repository {

    associatedtype Item

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void)
}
