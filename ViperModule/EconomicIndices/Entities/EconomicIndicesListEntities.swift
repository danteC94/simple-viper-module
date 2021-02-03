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
    let dolar_intercambio: EconomicIndexEntity
    let euro: EconomicIndexEntity
    let ipc: EconomicIndexEntity
    let utm: EconomicIndexEntity
    let imacec: EconomicIndexEntity
    let tpm: EconomicIndexEntity
    let libra_cobre: EconomicIndexEntity
    let tasa_desempleo: EconomicIndexEntity
    let bitcoin: EconomicIndexEntity
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
        return [uf, ivp, dolar, dolar_intercambio, euro, ipc, utm, imacec, tpm, libra_cobre, tasa_desempleo, bitcoin]
    }
}
