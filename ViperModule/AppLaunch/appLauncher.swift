//
//  appLauncher.swift
//  ViperModule
//
//  Created by dante on 31/01/2021.
//

import UIKit
import Foundation
import CoreData

public class ViperModule {
    private(set) static var context: NSManagedObjectContext?
    let navigationController: UINavigationController

    public init(context: NSManagedObjectContext, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.setUpContextDB()
        self.startApp()
    }

    func startApp() {
        let loginView = LoginRouter().createModule()
        self.navigationController.pushViewController(loginView, animated: true)
    }

    func setUpContextDB() {
        let db = DataBase()
        let context = db.persistentContainer.viewContext
        ViperModule.context = context
    }
}
