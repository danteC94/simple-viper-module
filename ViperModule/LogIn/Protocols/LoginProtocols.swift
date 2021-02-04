//
//  LoginProtocols.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation
import UIKit

protocol LoginViewToPresenterProtocol {
    var loginView: LoginPresenterToLoginViewProtocol? { get set }

    func checkCredentials(email: String, pass: String)
}

protocol LoginPresenterToLoginViewProtocol: class {
    var presenter: LoginViewToPresenterProtocol? { get set }

    func showErrorMessage()
}

protocol LoginInteractorToLoginPresenterProtocol: class {
    var interactor: LoginPresenterToLoginInteractorProtocol? { get set }

    func userFetchSuccess(email: String)
    func userFetchFailure()
}

protocol LoginPresenterToLoginInteractorProtocol {
    var presenter: LoginInteractorToLoginPresenterProtocol? { get set }

    func fetchUser(email: String, pass: String)
    func setUpDataBase()
}

protocol LoginPresenterToLoginRouterProtocol {
    var presenter: LoginRouterToLoginPresenterProtocol? { get set }

    func pushEconomicIndicesModule(email: String)
}

protocol LoginRouterToLoginPresenterProtocol: class {
    var router: LoginPresenterToLoginRouterProtocol? { get set }

    func setUpDataBase()
}

protocol LoginModuleAssemblerProtocol {
    func assembleModule(router: LoginRouter) -> UIViewController
}
