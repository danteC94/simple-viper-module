//
//  EconomicIndicesListInteractor.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import Foundation

class EconomicIndicesListInteractor {
    var presenter: EILInteractorToEILPresenterProtocol?
    var networkManager: NetworkManager = AlamofireNetworkManager()
}

extension EconomicIndicesListInteractor: EILPresenterToEILInteractorProtocol {
    func requestEconomicIndices() {
        self.networkManager.getEconomicIndicesList(success: { [weak self] economicIndices in
            self?.presenter?.economicIndicesRequestSuccess(economicIndices: economicIndices)
        }, failure: { [weak self] in
            self?.presenter?.economicIndicesRequestFail()
        })
    }
}
