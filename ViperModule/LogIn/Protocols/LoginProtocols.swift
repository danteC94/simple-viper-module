//
//  LoginProtocols.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation

protocol LoginViewToPresenterProtocol {
    func checkCredentials(email: String, pass: String)
}

protocol PresenterToLoginViewProtocol {
    func showErrorMessage()
}

protocol InteractorToPresenterProtocol {
    func userFetchSuccess()
    func userFetchFailure()
}

protocol PresenterToInteractorProtocol {
    func fetchUser(email: String, pass: String)
}

protocol PresenterToRouterProtocol {
    func createModule() -> LoginViewController
    func showEconomicIndicesView()
}

protocol RouterToPresenterProtocol {

}
