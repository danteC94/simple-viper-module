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

protocol PresenterToLoginViewProtocol {
    func showErrorMessage()
    func getNavigationController() -> UINavigationController?
}

protocol InteractorToPresenterProtocol {
    func userFetchSuccess(email: String)
    func userFetchFailure()
}

protocol PresenterToInteractorProtocol {
    func fetchUser(email: String, pass: String)
    func setUpDataBase()
}

protocol PresenterToRouterProtocol {
    func pushEconomicIndicesModule(email: String)
}

protocol RouterToPresenterProtocol {
    func setUpDataBase()
}
