//
//  LoginProtocols.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation
import UIKit

protocol LoginViewToPresenterProtocol {
    func checkCredentials(email: String, pass: String)
}

protocol LoginPresenterToLoginViewProtocol: class {
    func showErrorMessage()
    func getNavigationController() -> UINavigationController?
}

protocol LoginInteractorToLoginPresenterProtocol: class {
    func userFetchSuccess(email: String)
    func userFetchFailure()
}

protocol LoginPresenterToLoginInteractorProtocol: class {
    func fetchUser(email: String, pass: String)
    func setUpDataBase()
}

protocol LoginPresenterToLoginRouterProtocol: class {
    func pushEconomicIndicesModule(email: String)
}

protocol LoginRouterToLoginPresenterProtocol: class {
    func setUpDataBase()
}
