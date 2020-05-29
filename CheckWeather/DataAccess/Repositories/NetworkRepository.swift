//
//  NetworkRepository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Alamofire
import Foundation

struct NetworkRepository<Item> where Item: Decodable {}

extension NetworkRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Item, RepositoryError>) -> Void) {
        guard let specification = specification as? NetworkSpecification else {
            completion(.failure(.other))
            return
        }

        AF.request(specification.apiRoute).responseDecodable(of: Item.self) {
            guard let data = $0.value else {
                completion(.failure(.other))
                return
            }

            completion(.success(data))
        }
    }
}
