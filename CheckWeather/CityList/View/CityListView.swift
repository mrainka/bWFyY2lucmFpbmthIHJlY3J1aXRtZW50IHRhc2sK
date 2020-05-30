//
//  CityListView.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

final class CityListView: CustomView {

    private(set) var model: CityListViewModel?

    private weak var tableView: UITableView?

    override func addSubviews() {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityCell.self)
        addSubview(tableView)
        self.tableView = tableView
    }

    override func configureLayout() {
        tableView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension CityListView: ConfigurableWithModel {

    func configure(with model: CityListViewModel) {
        self.model = model
        tableView?.reloadData()
    }
}

extension CityListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.cities.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = model?.cities[indexPath.row] else { return .init() }
        let cell = tableView.dequeueReusableCell(with: city, for: indexPath)
        (cell as? CityCell)?.configure(with: city)
        return cell
    }
}

extension CityListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model?.selected(index: indexPath.row)
    }
}
