//
//  UnitCoreDataRepository.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import CoreData
import UIKit

struct UnitCoreDataRepository {

    private let configurationFetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)

    private var context: NSManagedObjectContext? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }

    private static let entityName = "Configuration"

    private static let keyPath = "unit"
}

extension UnitCoreDataRepository: Repository {

    func query(_ specification: Specification, completion: @escaping (Result<Unit, RepositoryError>) -> Void) {
        guard
            let rawUnit = (try? context?.fetch(configurationFetchRequest))?.first?.value(forKeyPath: Self.keyPath)
                as? Int16,
            let unit = Unit(rawValue: rawUnit)
        else {
            completion(.failure(.other))
            return
        }

        completion(.success(unit))
    }

    func update(_ item: Unit) {
        guard let context = context else { return }

        var configuration = (try? context.fetch(configurationFetchRequest))?.first

        if configuration == nil {
            guard let entity = NSEntityDescription.entity(forEntityName: Self.entityName, in: context) else { return }
            configuration = .init(entity: entity, insertInto: context)
        }

        configuration?.setValue(item.rawValue, forKeyPath: Self.keyPath)

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
