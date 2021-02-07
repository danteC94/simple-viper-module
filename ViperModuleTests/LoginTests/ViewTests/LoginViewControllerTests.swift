//
//  LoginViewControllerTests.swift
//  ViperModuleTests
//
//  Created by dante on 07/02/2021.
//

import XCTest
@testable import class ViperModule.LoginViewController
import protocol ViperModule.LoginViewToPresenterProtocol
import protocol ViperModule.LoginPresenterToLoginViewProtocol

class LoginViewControllerTests: XCTestCase, TestBase {
    var sut: LoginViewController!
    var presenter: LoginViewToPresenterProtocolMock!

    override func setUp() {
        super.setUp()
        self.sut = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        _ = sut.view
        self.presenter = LoginViewToPresenterProtocolMock()
        self.sut.presenter = self.presenter
    }

    override func tearDown() {
        self.sut = nil
        self.presenter = nil
        super.tearDown()
    }

    func testSignInWithoutCredentials() {
        self.givenNoCredentialsIntroduced()
        self.sut.signIn()

        XCTAssertFalse(self.presenter.checkCredentialsCalled)
    }

    func testSignInWithCredentials() {
        self.givenCredentialsIntroduced()
        self.sut.signIn()

        XCTAssertTrue(self.presenter.checkCredentialsCalled)
    }

    func givenNoCredentialsIntroduced() {
        self.sut.emailTextField.text = ""
        self.sut.passwordTextField.text = ""
    }

    func givenCredentialsIntroduced() {
        self.sut.emailTextField.text = "mock@gmail.com"
        self.sut.passwordTextField.text = "mockPass"
    }
}

extension LoginViewControllerTests {
    class LoginViewToPresenterProtocolMock: LoginViewToPresenterProtocol {
        var loginView: LoginPresenterToLoginViewProtocol?
        var checkCredentialsCalled = false

        func checkCredentials(email: String, pass: String) {
            self.checkCredentialsCalled = true
        }
    }
}
