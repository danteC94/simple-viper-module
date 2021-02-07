//
//  RouterTests.swift
//  ViperModuleTests
//
//  Created by dante on 03/02/2021.
//

import XCTest
@testable import class ViperModule.LoginRouter
import protocol ViperModule.LoginModuleAssemblerProtocol
import protocol ViperModule.LoginRouterToLoginPresenterProtocol
import protocol ViperModule.LoginPresenterToLoginRouterProtocol

class RouterTests: XCTestCase, TestBase {
    var sut: LoginRouter!
    var moduleAssembler: LoginModuleAssemblerMock!
    var presenter: LoginRouterToLoginPresenterProtocolMock!

    override func setUp() {
        super.setUp()
        self.sut = LoginRouter()
        self.moduleAssembler = LoginModuleAssemblerMock()
        self.presenter = LoginRouterToLoginPresenterProtocolMock()
        sut.presenter = presenter
    }

    override func tearDown() {
        self.sut = nil
        self.moduleAssembler = nil
        self.presenter = nil
        super.tearDown()
    }

    func testCreateModule() {
        let loginView = self.sut.createModule(navigationController: UINavigationController(),
                                              moduleAssembler: self.moduleAssembler)

        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.presentingViewController)
        XCTAssertNotNil(loginView)
    }

    func testSetUpDataBase() {
        self.sut.setUpDataBase()

        XCTAssertTrue(self.presenter.setUpDataBaseCalled)
    }
}

extension RouterTests {
    class LoginModuleAssemblerMock: LoginModuleAssemblerProtocol {
        func assembleModule(router: LoginRouter) -> UIViewController {
            return UIViewController()
        }
    }

    class LoginRouterToLoginPresenterProtocolMock: LoginRouterToLoginPresenterProtocol {
        var router: LoginPresenterToLoginRouterProtocol?

        var setUpDataBaseCalled = false
        func setUpDataBase() {
            self.setUpDataBaseCalled = true
        }
    }
}
