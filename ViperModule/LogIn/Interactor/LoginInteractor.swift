//
//  LoginInteractor.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import CoreData
import Foundation

class Interactor {
    var presenter: InteractorToPresenterProtocol?
    var dbManager: DataBaseManager = CoreDataManager()
}

extension Interactor: PresenterToInteractorProtocol {
    func fetchUser(email: String, pass: String) {
        do {
            guard try self.dbManager.getUser(email: email, password: pass) != nil else {
                self.presenter?.userFetchFailure()
                return
            }
            self.presenter?.userFetchSuccess(email: email)
        } catch let error as NSError {
            print("Could not fetch user. \(email), \(error.userInfo)")
            self.presenter?.userFetchFailure()
        }
    }

    func setUpDataBase() {
        // If the database is not empty return
        guard let users = self.dbManager.getUsers(), users.count == 0 else { return }
        for n in 1...3 {
            self.dbManager.saveUser(email: "juan\(n)@gmail.com", password: "juanPass\(n)")
        }
    }
}


