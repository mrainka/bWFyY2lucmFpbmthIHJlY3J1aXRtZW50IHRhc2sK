//
//  CustomViewController.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 29/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import UIKit

class CustomViewController<CustomViewType: UIView>: UIViewController {

    private(set) weak var customView: CustomViewType?
    var onCustomViewLoaded: ((CustomViewType) -> Void)?

    override func loadView() {
        let customView = CustomViewType(frame: .zero)
        view = customView
        self.customView = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customViewLoaded()
    }
}

extension CustomViewController: CustomViewContaining {}
