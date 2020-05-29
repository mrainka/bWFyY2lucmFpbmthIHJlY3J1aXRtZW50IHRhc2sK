//
//  NetworkRepository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Alamofire
import Foundation

final class NetworkRepository<Item> where Item: Decodable {

    private var cache = [APIRoute: Cache<Item>]()

    private func cache(_ item: Item, with specification: NetworkSpecification) {
        switch specification.cacheStatus {
        case .disabled:
            break
        case .enabled(let timeToLive):
            let apiRoute = specification.apiRoute
            let cache = self.cache[apiRoute] ?? .init()
            cache.item = item
            cache.onCleaned = { [weak self] in self?.cache.removeValue(forKey: apiRoute) }
            self.cache[specification.apiRoute] = cache
            cache.keepAlife(for: timeToLive)
        }
    }
}

extension NetworkRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void) {
        guard let specification = specification as? NetworkSpecification else {
            completion(.failure(.other))
            return
        }

        if case .enabled = specification.cacheStatus, let item = cache[specification.apiRoute]?.item {
            completion(.success(item))
            return
        }

        AF.request(specification.apiRoute).responseDecodable(of: Item.self) { [weak self] in
            guard let item = $0.value else {
                completion(.failure(.other))
                return
            }

            self?.cache(item, with: specification)

            completion(.success(item))
        }
    }
}
