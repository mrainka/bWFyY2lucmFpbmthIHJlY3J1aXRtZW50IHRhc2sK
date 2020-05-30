//
//  TemperatureView.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import SnapKit
import UIKit

final class TemperatureView: CustomView {

    private(set) var model: TemperatureViewModel?

    // MARK: - Subviews

    private weak var stackView: UIStackView?

    private weak var feelsLikeLabel: UILabel?
    private weak var maxMinView: MaxMinTemperatureView?
    private weak var valueLabel: UILabel?

    // MARK: -

    override func configureLayout() {
        stackView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    // MARK: - Adding the Subviews

    override func addSubviews() {
        addStackView()

        valueLabel = addLabel()
        addMaxMinView()
        feelsLikeLabel = addLabel()
    }

    private func addStackView() {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        addSubview(stackView)
        self.stackView = stackView
    }

    private func addLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        stackView?.addArrangedSubview(label)
        return label
    }

    private func addMaxMinView() {
        let maxMinView = MaxMinTemperatureView(frame: .zero)
        stackView?.addArrangedSubview(maxMinView)
        self.maxMinView = maxMinView
    }
}

extension TemperatureView: ConfigurableWithModel {

    func configure(with model: TemperatureViewModel) {
        self.model = model

        feelsLikeLabel?.text = model.feelsLike
        maxMinView?.configure(with: model.maxMin)
        valueLabel?.text = model.value
    }
}
