//
//  LoginModuleAssemblerTests.swift
//  ViperModuleTests
//
//  Created by dante on 03/02/2021.
//

import XCTest
@testable import class ViperModule.LoginModuleAssembler
@testable import class ViperModule.LoginRouter
@testable import class ViperModule.LoginViewController
@testable import protocol ViperModule.LoginRouterToLoginPresenterProtocol
@testable import protocol ViperModule.LoginInteractorToLoginPresenterProtocol

class LoginModuleAssemblerTests: XCTestCase, TestBase {
    var sut: LoginModuleAssembler!

    override func setUp() {
        super.setUp()
        self.sut = LoginModuleAssembler()
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testAssembleModule() {
        let loginRouter = LoginRouter()
        let view = self.sut.assembleModule(router: loginRouter) as! LoginViewController

        XCTAssertNotNil(view)
        XCTAssertNotNil(view.presenter)
        XCTAssertNotNil(view.presenter!.loginView)
        XCTAssertNotNil((view.presenter! as! LoginRouterToLoginPresenterProtocol).router)
        XCTAssertNotNil((view.presenter! as! LoginRouterToLoginPresenterProtocol).router!.presenter)
        XCTAssertNotNil((view.presenter! as! LoginInteractorToLoginPresenterProtocol).interactor)
        XCTAssertNotNil((view.presenter! as! LoginInteractorToLoginPresenterProtocol).interactor!.presenter)
    }
}
