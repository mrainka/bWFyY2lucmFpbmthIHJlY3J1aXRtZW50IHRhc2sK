//
//  WeatherView.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 30/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

final class WeatherView: CustomView {

    private var disposeBag = DisposeBag()

    var model: WeatherViewModel?

    // MARK: - Subviews

    private weak var stackView: UIStackView?

    private weak var pressureLabel: UILabel?
    private weak var temperatureView: TemperatureView?

    // MARK: - Adding the Subviews

    override func addSubviews() {
        addStackView()

        addTemperatureView()
        addPressureLabel()
    }

    private func addStackView() {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 16
        addSubview(stackView)
        self.stackView = stackView
    }

    private func addPressureLabel() {
        let label = UILabel(frame: .zero)
        stackView?.addArrangedSubview(label)
        pressureLabel = label
    }

    private func addTemperatureView() {
        let temperatureView = TemperatureView(frame: .zero)
        stackView?.addArrangedSubview(temperatureView)
        self.temperatureView = temperatureView
    }

    // MARK: - Configuring

    override func configure() {
        super.configure()
        backgroundColor = .systemBackground
    }

    override func configureLayout() {
        stackView?.snp.makeConstraints { $0.left.right.top.equalToSuperview().inset(8) }
    }
}

extension WeatherView: ConfigurableWithModel {

    func configure(with model: WeatherViewModel) {
        disposeBag = .init()

        self.model = model

        if let pressureLabel = pressureLabel {
            model.pressure.bind(to: pressureLabel.rx.text).disposed(by: disposeBag)
        }

        model
            .temperature
            .subscribe(onNext: { [unowned self] in
                guard let temperature = $0 else { return }
                self.temperatureView?.configure(with: temperature)
            })
            .disposed(by: disposeBag)
    }
}
