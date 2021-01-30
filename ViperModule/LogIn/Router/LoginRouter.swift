//
//  LoginRouter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation

class LoginRouter: PresenterToRouterProtocol {
    func createModule() -> LoginViewController {
        let loginView = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let presenter = LoginPresenter()
        let interactor = Interactor()
        let router = LoginRouter()

        loginView.presenter = presenter
        presenter.loginView = loginView
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return loginView
    }

    func showEconomicIndicesView() {

    }

//    let myViewController = MyViewController(nibName: "MyViewController", bundle: nil)
}
