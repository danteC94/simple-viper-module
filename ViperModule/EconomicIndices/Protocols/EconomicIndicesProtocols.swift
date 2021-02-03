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
}

protocol EILPresenterToEILViewProtocol {
    func showEconomicIndices(economicIndices: [EconomicIndexDTO])
}

protocol EILInteractorToEILPresenterProtocol {
    func economicIndicesRequestSuccess(economicIndices: EconomicIndicesEntity)
    func economicIndicesRequestFail()
}

protocol EILPresenterToEILInteractorProtocol {
    func requestEconomicIndices()
}

protocol EILPresenterToEILRouterProtocol {
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO)
//    func pushEconomicIndicesModule(navVC: UINavigationController)
}

protocol EILRouterToEILPresenterProtocol {
    
}
