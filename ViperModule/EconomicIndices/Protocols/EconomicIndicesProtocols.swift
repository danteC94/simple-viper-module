//
//  EconomicIndicesProtocols.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import Foundation

protocol EILViewToEILPresenterProtocol {
    func getEconomicIndices()
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO)
    func logOut()
}

protocol EILPresenterToEILViewProtocol: class {
    func showEconomicIndices(economicIndices: [EconomicIndexDTO])
}

protocol EILInteractorToEILPresenterProtocol: class {
    func economicIndicesRequestSuccess(economicIndices: EconomicIndicesEntity)
    func economicIndicesRequestFail()
}

protocol EILPresenterToEILInteractorProtocol: class {
    func requestEconomicIndices()
}

protocol EILPresenterToEILRouterProtocol: class {
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO)
    func logOut()
}

protocol EILRouterToEILPresenterProtocol: class {
    
}
