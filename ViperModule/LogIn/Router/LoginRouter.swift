//
//  LoginRouter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import UIKit

public class LoginRouter {
    weak var presenter: LoginRouterToLoginPresenterProtocol?
    var presentingViewController: UINavigationController?

    func createModule(navigationController: UINavigationController, moduleAssembler: LoginModuleAssemblerProtocol) -> UIViewController {
        self.presentingViewController = navigationController
        let loginView = moduleAssembler.assembleModule(router: self)

        return loginView
    }

    func setUpDataBase() {
        self.presenter?.setUpDataBase()
    }
}

extension LoginRouter: LoginPresenterToLoginRouterProtocol {
    func pushEconomicIndicesModule(email: String) {
        guard let presentingViewController = self.presentingViewController else { return }

        let view = EconomicIndicesRouter().createModule(navigationController: presentingViewController, userEmail: email)
        presentingViewController.pushViewController(view, animated: true)
        
    }
}
