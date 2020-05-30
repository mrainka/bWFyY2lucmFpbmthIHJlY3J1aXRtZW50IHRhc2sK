//
//  CityListViewController.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import UIKit

final class CityListViewController: CustomViewController<CityListView> {

    private func addUnitButton() {
        navigationItem.rightBarButtonItem = .init(
            title: "Unit",
            style: .plain,
            target: self,
            action: #selector(unitClicked))
    }

    @objc private func unitClicked(_ button: UIBarButtonItem) {
        let alert = UIAlertController(title: "Select the unit", message: nil, preferredStyle: .actionSheet)

        alert.popoverPresentationController?.barButtonItem = button

        model?.unit.units.forEach { unit in
            alert.addAction(.init(title: unit, style: .default) { [weak self] _ in self?.model?.unit.selected(unit) })
        }

        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addUnitButton()
    }
}

extension CityListViewController: ConfigurableWithModel {

    func configure(with model: CityListViewModel) {
        configureCustomView(with: model)

        model.onOpenWeather = { [weak self] in
            let view = WeatherViewController()
            view.configure(with: $0)
            self?.navigationController?.pushViewController(view, animated: true)
        }
    }
}
