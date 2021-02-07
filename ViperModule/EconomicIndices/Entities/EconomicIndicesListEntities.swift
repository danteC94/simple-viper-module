//
//  EconomicIndicesListEntities.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

struct EconomicIndicesEntity: Decodable {
    let version: String
    let autor: String
    let fecha: String
    let uf: EconomicIndexEntity
    let ivp: EconomicIndexEntity
    let dolar: EconomicIndexEntity
    let dolarIntercambio: EconomicIndexEntity
    let euro: EconomicIndexEntity
    let ipc: EconomicIndexEntity
    let utm: EconomicIndexEntity
    let imacec: EconomicIndexEntity
    let tpm: EconomicIndexEntity
    let libraCobre: EconomicIndexEntity
    let tasaDesempleo: EconomicIndexEntity
    let bitcoin: EconomicIndexEntity

    enum CodingKeys: String, CodingKey {
        case version, autor, fecha, uf, ivp, dolar, euro, ipc, utm, imacec, tpm, bitcoin
        case dolarIntercambio = "dolar_intercambio"
        case libraCobre = "libra_cobre"
        case tasaDesempleo = "tasa_desempleo"
    }
}

struct EconomicIndexEntity: Decodable {
    let codigo: String
    let nombre: String
    let unidadMedida: String
    let fecha: String
    let valor: Float

    enum CodingKeys: String, CodingKey {
        case codigo, nombre, fecha, valor
        case unidadMedida = "unidad_medida"
    }
}

extension EconomicIndicesEntity {
    func getEconomicIndices() -> [EconomicIndexEntity] {
        return [uf, ivp, dolar, dolarIntercambio, euro, ipc, utm, imacec, tpm, libraCobre, tasaDesempleo, bitcoin]
    }
}
