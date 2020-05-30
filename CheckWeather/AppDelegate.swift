//
//  AppDelegate.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 28/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?

    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let cityListView = CityListViewController()
        cityListView.configure(with: .init())
        window.rootViewController = cityListView
        window.makeKeyAndVisible()
        self.window = window
    }
}

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
            -> Bool
    {
        configureWindow()
        return true
    }
}
