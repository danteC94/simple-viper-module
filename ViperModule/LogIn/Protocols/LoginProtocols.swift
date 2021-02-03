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

protocol LoginPresenterToLoginViewProtocol {
    func showErrorMessage()
    func getNavigationController() -> UINavigationController?
}

protocol LoginInteractorToLoginPresenterProtocol {
    func userFetchSuccess(email: String)
    func userFetchFailure()
}

protocol LoginPresenterToLoginInteractorProtocol {
    func fetchUser(email: String, pass: String)
    func setUpDataBase()
}

protocol LoginPresenterToLoginRouterProtocol {
    func pushEconomicIndicesModule(email: String)
}

protocol LoginRouterToLoginPresenterProtocol {
    func setUpDataBase()
}
