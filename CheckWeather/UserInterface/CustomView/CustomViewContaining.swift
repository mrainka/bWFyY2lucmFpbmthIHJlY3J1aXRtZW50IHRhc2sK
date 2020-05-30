//
//  CustomViewContaining.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import UIKit

protocol CustomViewContaining: class {

    associatedtype CustomViewType: UIView

    var customView: CustomViewType? { get }

    var onCustomViewLoaded: ((CustomViewType) -> Void)? { get set }
}

extension CustomViewContaining {

    func customViewLoaded() {
        guard let customView = customView else { return }
        onCustomViewLoaded?(customView)
    }
}
