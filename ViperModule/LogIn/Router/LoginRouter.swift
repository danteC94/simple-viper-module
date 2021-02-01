//
//  LoginRouter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import UIKit

class LoginRouter: PresenterToRouterProtocol {
    var presenter: RouterToPresenterProtocol?
    func createModule() -> LoginViewController {
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

    func showEconomicIndicesView(navVC: UINavigationController) {
        // let economicIndicesModule = EconomicIndices.createmodule
        // navVC.pushViewController(economicIndicesModule)
    }
}
