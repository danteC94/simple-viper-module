//
//  EconomicIndicesListEntities.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

struct EconomicIndices: Decodable {
    let version: String
    let autor: String
    let fecha: String
    let economicIndexDesc: [EconomicIndex]
}

struct EconomicIndex: Decodable {
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
