//
//  EconomicIndicesListPresenter.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import Foundation

class EconomicIndicesListPresenter {
    var eilView: EILPresenterToEILViewProtocol?
    var eilInteractor: EILPresenterToEILInteractorProtocol?
    var eilRouter: EILPresenterToEILRouterProtocol?

    func createEconomicIndicesDTO(from economicIndexDesc: EconomicIndex) -> EconomicIndexDTO {
        let economicIndexDTO: EconomicIndexDTO = EconomicIndexDTO(codigo: economicIndexDesc.codigo,
                                                                  nombre: economicIndexDesc.nombre,
                                                                  unidadMedida: economicIndexDesc.unidadMedida,
                                                                  fecha: economicIndexDesc.fecha,
                                                                  valor: economicIndexDesc.valor)
        return economicIndexDTO
    }
}

extension EconomicIndicesListPresenter: EILViewToEILPresenterProtocol {
    func getEconomicIndices() {
        self.eilInteractor?.requestEconomicIndices()
    }
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO) {
        eilRouter?.showEconomicIndexDetails(economicIndex: economicIndex)
    }
}

extension EconomicIndicesListPresenter: EILInteractorToEILPresenterProtocol {
    func economicIndicesRequestSuccess(economicIndices: EconomicIndices) {
        let economicIndexDTOs = economicIndices.economicIndexDesc.map{ economicIndex in
            self.createEconomicIndicesDTO(from: economicIndex)
        }
        self.eilView?.showEconomicIndices(economicIndices: economicIndexDTOs)
    }

    func economicIndicesRequestFail() {

    }
}

extension EconomicIndicesListPresenter: EILRouterToEILPresenterProtocol {
    
}
