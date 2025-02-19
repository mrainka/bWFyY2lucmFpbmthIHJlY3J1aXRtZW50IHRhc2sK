//
//  AppDelegate.swift
//  CheckWeather
//
//  Created by Marcin Rainka on 28/05/2020.
//  Copyright © 2020 Marcin Rainka. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CheckWeather")
        container.loadPersistentStores { _, _ in }
        return container
    }()

    private let repositories = Repositories(unit: .init(UnitCoreDataRepository()), weather: .init(NetworkRepository()))

    var window: UIWindow?

    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let cityListView = CityListViewController()
        cityListView.configure(with: .init(repositories: .init(repositories)))
        let navigatedCityListView = UINavigationController(rootViewController: cityListView)
        navigatedCityListView.navigationBar.isTranslucent = false
        window.rootViewController = navigatedCityListView
        window.makeKeyAndVisible()
        self.window = window
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        try? context.save()
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

    func applicationWillTerminate(_ application: UIApplication) {
        saveContext()
    }
}
