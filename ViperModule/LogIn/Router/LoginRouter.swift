//
//  LoginRouter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import UIKit

class LoginRouter {
    weak var presenter: LoginRouterToLoginPresenterProtocol?
    var presentingViewController: UINavigationController?

    func createModule(navigationController: UINavigationController) -> LoginViewController {
        self.presentingViewController = navigationController

        let loginView = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        let presenter = LoginPresenter()
        let interactor = Interactor()

        self.presenter = presenter
        loginView.presenter = presenter
        presenter.loginView = loginView
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        self.presenter?.setUpDataBase()

        return loginView
    }
}

extension LoginRouter: LoginPresenterToLoginRouterProtocol {
    func pushEconomicIndicesModule(email: String) {
        guard let presentingViewController = self.presentingViewController else { return }

        let view = EconomicIndicesRouter().createModule(navigationController: presentingViewController, userEmail: email)
        presentingViewController.pushViewController(view, animated: true)
        
    }
}
