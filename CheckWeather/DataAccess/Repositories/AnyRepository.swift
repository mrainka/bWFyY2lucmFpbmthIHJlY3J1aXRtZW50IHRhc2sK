//
//  AnyRepository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct AnyRepository<Item> {

    private let onQueried: (Specification, @escaping (Result<Item, RepositoryError>) -> Void) -> Void

    init<RepositoryType: Repository>(_ repository: RepositoryType) where RepositoryType.Item == Item {
        onQueried = repository.query
    }
}

extension AnyRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void) {
        onQueried(specification, completion)
    }
}
