//
//  LoginModuleAssembler.swift
//  ViperModule
//
//  Created by dante on 03/02/2021.
//

import UIKit

class LoginModuleAssembler: LoginModuleAssemblerProtocol {
    func assembleModule(router: LoginRouter) -> UIViewController {
        let loginView = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()

        loginView.presenter = presenter
        presenter.loginView = loginView
        presenter.router = router
        router.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter

        return loginView
    }
}
