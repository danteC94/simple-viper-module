//
//  LoginPresenterTests.swift
//  ViperModuleTests
//
//  Created by dante on 04/02/2021.
//

import XCTest
@testable import class ViperModule.LoginPresenter
import protocol ViperModule.LoginViewToPresenterProtocol
import protocol ViperModule.LoginPresenterToLoginViewProtocol
import protocol ViperModule.LoginPresenterToLoginInteractorProtocol
import protocol ViperModule.LoginInteractorToLoginPresenterProtocol
import protocol ViperModule.LoginPresenterToLoginRouterProtocol
import protocol ViperModule.LoginRouterToLoginPresenterProtocol

class LoginPresenterTests: XCTestCase, TestBase {
    var sut: LoginPresenter!
    var loginView: LoginViewToPresenterProtocolMock!
    var interactor: LoginPresenterToLoginInteractorProtocolMock!
    var router: LoginPresenterToLoginRouterProtocolMock!

    override func setUp() {
        super.setUp()
        self.sut = LoginPresenter()
        self.loginView = LoginViewToPresenterProtocolMock()
        self.sut.loginView = self.loginView
        self.interactor = LoginPresenterToLoginInteractorProtocolMock()
        self.sut.interactor = self.interactor
        self.router = LoginPresenterToLoginRouterProtocolMock()
        self.sut.router = self.router
    }

    override func tearDown() {
        self.sut = nil
        self.loginView = nil
        self.interactor = nil
        self.router = nil
        super.tearDown()
    }

    func testUserFetchFailure() {
        self.sut.userFetchFailure()

        XCTAssertTrue(self.loginView.showErrorMessageCalled)
    }

    func testCheckCredentials() {
        self.sut.checkCredentials(email: "mock@gmail.com", pass: "mockPass")

        XCTAssertTrue(self.interactor.fetchUserCalled)
    }

    func testSetUpDataBase() {
        self.sut.setUpDataBase()

        XCTAssertTrue(self.interactor.setUpDataBaseCalled)
    }

    func testUserFetchSuccess() {
        self.sut.userFetchSuccess(email: "mock@gmail.com")

        XCTAssertTrue(self.router.pushEconomicIndicesModuleCalled)
    }
}

extension LoginPresenterTests {
    class LoginViewToPresenterProtocolMock: LoginPresenterToLoginViewProtocol {
        var presenter: LoginViewToPresenterProtocol?
        var showErrorMessageCalled = false

        func showErrorMessage() {
            self.showErrorMessageCalled = true
        }
    }

    class LoginPresenterToLoginInteractorProtocolMock: LoginPresenterToLoginInteractorProtocol {
        var presenter: LoginInteractorToLoginPresenterProtocol?
        var fetchUserCalled = false
        var setUpDataBaseCalled = false

        func fetchUser(email: String, pass: String) {
            self.fetchUserCalled = true
        }

        func setUpDataBase() {
            self.setUpDataBaseCalled = true
        }
    }

    class LoginPresenterToLoginRouterProtocolMock: LoginPresenterToLoginRouterProtocol {
        var presenter: LoginRouterToLoginPresenterProtocol?
        var pushEconomicIndicesModuleCalled = false

        func pushEconomicIndicesModule(email: String) {
            self.pushEconomicIndicesModuleCalled = true
        }
    }
}
