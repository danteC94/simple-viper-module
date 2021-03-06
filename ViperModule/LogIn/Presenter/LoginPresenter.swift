//
//  LoginPresenter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation

class LoginPresenter {
    weak var loginView: LoginPresenterToLoginViewProtocol?
    var interactor: LoginPresenterToLoginInteractorProtocol?
    var router: LoginPresenterToLoginRouterProtocol?
}

extension LoginPresenter: LoginViewToPresenterProtocol {
    func checkCredentials(email: String, pass: String) {
        self.interactor?.fetchUser(email: email, pass: pass)
    }
}

extension LoginPresenter: LoginInteractorToLoginPresenterProtocol {
    func userFetchSuccess(email: String) {
        self.router?.pushEconomicIndicesModule(email: email)
    }
    func userFetchFailure() {
        self.loginView?.showErrorMessage()
    }
}

extension LoginPresenter: LoginRouterToLoginPresenterProtocol {
    func setUpDataBase() {
        self.interactor?.setUpDataBase()
    }
}
