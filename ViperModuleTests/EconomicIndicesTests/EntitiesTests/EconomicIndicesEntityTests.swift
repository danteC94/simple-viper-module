//
//  EconomicIndicesEntityTests.swift
//  ViperModuleTests
//
//  Created by dante on 07/02/2021.
//

import XCTest
@testable import class ViperModule.JsonDecoder
@testable import struct ViperModule.EconomicIndicesEntity

class EconomicIndicesEntityTests: XCTestCase, TestBase {
    var sut: EconomicIndicesEntity!

    func testDecodeEconomicIndicesEntity() {
        sut = JsonDecoder(resource: "MockEconomicIndicesEntity", resourceBundle: "com.dante.ViperModuleTests").decodeModel(forType: EconomicIndicesEntity.self)

        XCTAssertEqual(sut.version, "1.6.0")
        XCTAssertEqual(sut.autor, "mindicador.cl")
        XCTAssertEqual(sut.fecha, "2021-02-07T21:00:00.000Z")
        XCTAssertEqual(sut.uf.codigo, "uf")
        XCTAssertEqual(sut.ivp.codigo, "ivp")
        XCTAssertEqual(sut.dolar.codigo, "dolar")
        XCTAssertEqual(sut.dolarIntercambio.codigo, "dolar_intercambio")
        XCTAssertEqual(sut.euro.codigo, "euro")
        XCTAssertEqual(sut.ipc.codigo, "ipc")
        XCTAssertEqual(sut.utm.codigo, "utm")
        XCTAssertEqual(sut.imacec.codigo, "imacec")
        XCTAssertEqual(sut.tpm.codigo, "tpm")
        XCTAssertEqual(sut.libraCobre.codigo, "libra_cobre")
        XCTAssertEqual(sut.tasaDesempleo.codigo, "tasa_desempleo")
        XCTAssertEqual(sut.bitcoin.codigo, "bitcoin")
    }
}
