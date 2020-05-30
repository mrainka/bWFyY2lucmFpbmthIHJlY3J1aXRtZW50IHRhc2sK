//
//  WithModelConfiguring.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

protocol ConfigurableWithModel {

    associatedtype Model

    var model: Model? { get }

    func configure(with model: Model)
}

extension ConfigurableWithModel where Self: CustomViewContaining, CustomViewType: ConfigurableWithModel {

    var model: CustomViewType.Model? { customView?.model }

    func configure(with model: CustomViewType.Model) {
        configureCustomView(with: model)
    }

    func configureCustomView(with model: CustomViewType.Model) {
        if let customView = customView {
            customView.configure(with: model)
        } else {
            onCustomViewLoaded = { $0.configure(with: model) }
        }
    }
}
