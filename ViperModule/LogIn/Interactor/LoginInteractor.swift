//
//  LoginInteractor.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import Foundation

class Interactor {
    var presenter: InteractorToPresenterProtocol?
}

extension Interactor: PresenterToInteractorProtocol {
    func fetchUser(email: String, pass: String) {
        if MockUsers.users.contains(where: {$0.email == email && $0.password == pass}) {
            self.presenter?.userFetchSuccess()
        } else {
            self.presenter?.userFetchFailure()
        }
    }
}


struct MockUsers {
    static let users: [User] =
        [User(email: "test@gmail.com", password: "passhash"),
         User(email: "test2@gmail.com", password: "passhash2")
        ]
}
