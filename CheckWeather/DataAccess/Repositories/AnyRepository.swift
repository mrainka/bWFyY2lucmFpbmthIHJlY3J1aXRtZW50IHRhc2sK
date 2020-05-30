//
//  AnyRepository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

struct AnyRepository<Item> {

    private let onQuery: (Specification, @escaping (Result<Item, RepositoryError>) -> Void) -> Void
    private let onUpdate: (Item) -> Void

    init<RepositoryType: Repository>(_ repository: RepositoryType) where RepositoryType.Item == Item {
        onQuery = repository.query
        onUpdate = repository.update
    }
}

extension AnyRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void) {
        onQuery(specification, completion)
    }

    func update(_ item: Item) {
        onUpdate(item)
    }
}
