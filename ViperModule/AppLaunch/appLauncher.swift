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
        ViperModule.context = context
        self.startApp()
    }

    func startApp() {
        let router = LoginRouter()
        let moduleAssembler = LoginModuleAssembler()
        let loginView = router.createModule(navigationController: self.navigationController, moduleAssembler: moduleAssembler)
        router.setUpDataBase()
        self.navigationController.pushViewController(loginView, animated: true)
    }
}
