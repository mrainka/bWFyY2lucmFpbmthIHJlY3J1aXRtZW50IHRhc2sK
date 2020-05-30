//
//  MaxMinTemperatureView.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import SnapKit
import UIKit

final class MaxMinTemperatureView: CustomView {

    private(set) var model: MaxMinTemperatureViewModel?

    // MARK: - Subviews

    private weak var stackView: UIStackView?

    private weak var maxLabel: UILabel?
    private weak var minLabel: UILabel?

    // MARK: -

    override func configureLayout() {
        stackView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    // MARK: - Adding the Subviews

    override func addSubviews() {
        addStackView()

        maxLabel = addLabel()
        minLabel = addLabel()
    }

    private func addStackView() {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
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
}

extension MaxMinTemperatureView: ConfigurableWithModel {

    func configure(with model: MaxMinTemperatureViewModel) {
        self.model = model

        maxLabel?.text = model.max
        minLabel?.text = model.min
    }
}
