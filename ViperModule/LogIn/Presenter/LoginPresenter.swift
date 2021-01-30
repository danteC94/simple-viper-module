//
//  LoginPresenter.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation

class LoginPresenter {
    var loginView: PresenterToLoginViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
}

extension LoginPresenter: LoginViewToPresenterProtocol {
    func checkCredentials(email: String, pass: String) {
        self.interactor?.fetchUser(email: email, pass: pass)
    }
}

extension LoginPresenter: InteractorToPresenterProtocol {
    func userFetchSuccess() {
        
    }
    func userFetchFailure() {
        self.loginView?.showErrorMessage()
    }
}
