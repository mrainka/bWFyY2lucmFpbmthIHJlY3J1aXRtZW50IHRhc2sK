//
//  UITableViewCellRegisteringAndDequeuing.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func dequeueReusableCell(with item: CellReusable, for indexPath: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: type(of: item).cellReuseIdentifier, for: indexPath)
    }

    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type)
        where Cell: ConfigurableWithModel, Cell.Model: CellReusable
    {
        register(cellClass, forCellReuseIdentifier: Cell.Model.cellReuseIdentifier)
    }
}
