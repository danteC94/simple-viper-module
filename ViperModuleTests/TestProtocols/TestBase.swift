//
//  TestBase.swift
//  ViperModuleTests
//
//  Created by dante on 03/02/2021.
//

protocol TestBase {
    associatedtype SystemUnderTest
    /// The system under test(AKA: sut) represents
    /// the object intended to test.
    var sut: SystemUnderTest! { get set }
}
