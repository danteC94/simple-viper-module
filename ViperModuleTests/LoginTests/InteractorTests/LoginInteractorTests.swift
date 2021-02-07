//
//  LoginInteractorTests.swift
//  ViperModuleTests
//
//  Created by dante on 07/02/2021.
//

import XCTest
import CoreData
@testable import class ViperModule.LoginInteractor
@testable import struct ViperModule.UserEntity
@testable import protocol ViperModule.DataBaseManager
@testable import protocol ViperModule.LoginPresenterToLoginViewProtocol
@testable import protocol ViperModule.LoginInteractorToLoginPresenterProtocol
@testable import protocol ViperModule.LoginPresenterToLoginInteractorProtocol

class LoginInteractorTests: XCTestCase, TestBase {
    var sut: LoginInteractor!
    var dbManager: DataBaseManagerMock!
    var presenter: LoginInteractorToLoginPresenterProtocolMock!

    override func setUp() {
        super.setUp()
        self.sut = LoginInteractor()
        self.dbManager = DataBaseManagerMock()
        self.sut.dbManager = self.dbManager
        self.presenter = LoginInteractorToLoginPresenterProtocolMock()
        self.sut.presenter = self.presenter
    }

    override func tearDown() {
        self.sut = nil
        self.dbManager = nil
        self.presenter = nil
        super.tearDown()
    }

    func testFetchUserSuccessWithExistentUser() {
        self.sut.fetchUser(email: "mockValidUser@gmail.com", pass: "mockPassValidUser")

        XCTAssertTrue(self.presenter.userFetchSuccessCalled)
    }

    func testFetchUserSuccessWithNonExistentUser() {
        self.sut.fetchUser(email: "mock1@gmail.com", pass: "mockPass1")

        XCTAssertFalse(self.presenter.userFetchSuccessCalled)
        XCTAssertTrue(self.presenter.userFetchFailureCalled)
    }

    func testFetchUserFailsWhileFetchingUser() {
        self.sut.fetchUser(email: "mockInvalidUser@gmail.com", pass: "mockPassInvalidUser")

        XCTAssertTrue(self.presenter.userFetchFailureCalled)
    }

    func testSetUpDataBaseWithExistentUsers() {
        self.givenADataBaseWithThreeStoredUsers()

        self.sut.setUpDataBase()

        XCTAssertTrue(self.dbManager.getUsersCalled)
        XCTAssertFalse(self.dbManager.saveUserCalled)
    }

    func testSetUpDataBaseWithoutExistentUsers() {
        self.sut.setUpDataBase()

        XCTAssertTrue(self.dbManager.getUsersCalled)
        XCTAssertTrue(self.dbManager.saveUserCalled)
    }

    func givenADataBaseWithThreeStoredUsers() {
        self.dbManager.storedUsers = [
            NSManagedObject(),
            NSManagedObject(),
            NSManagedObject()
        ]
    }
}

extension LoginInteractorTests {
    class DataBaseManagerMock: DataBaseManager {
        var saveUserCalled = false
        var getUserCalled = false
        var getUsersCalled = false
        var storedUsers: [NSManagedObject]? = []

        func saveUser(email: String, password: String) {
            self.saveUserCalled = true
        }

        func getUser(email: String, password: String) throws -> UserEntity? {
            self.getUserCalled = true

            switch (email, password) {
            case ("mockValidUser@gmail.com", "mockPassValidUser"):
                return UserEntity(email: email, password: Data(base64Encoded: "password")!)
            case ("mockInvalidUser@gmail.com", "mockPassInvalidUser"):
                throw NSError()
            default:
                return nil
            }
        }

        func getUsers() -> [NSManagedObject]? {
            self.getUsersCalled = true
            return self.storedUsers
        }
    }

    class LoginInteractorToLoginPresenterProtocolMock: LoginInteractorToLoginPresenterProtocol {
        var interactor: LoginPresenterToLoginInteractorProtocol?
        var userFetchSuccessCalled = false
        var userFetchFailureCalled = false

        func userFetchSuccess(email: String) {
            self.userFetchSuccessCalled = true
        }

        func userFetchFailure() {
            self.userFetchFailureCalled = true
        }
    }
}
