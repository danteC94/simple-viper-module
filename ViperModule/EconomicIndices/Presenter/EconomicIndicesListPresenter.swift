//
//  EconomicIndicesListPresenter.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import Foundation

class EconomicIndicesListPresenter {
    weak var eilView: EILPresenterToEILViewProtocol?
    var eilInteractor: EILPresenterToEILInteractorProtocol?
    var eilRouter: EILPresenterToEILRouterProtocol?

    func createEconomicIndicesDTO(from economicIndexDesc: EconomicIndexEntity) -> EconomicIndexDTO {
        let economicIndexDTO: EconomicIndexDTO = EconomicIndexDTO(codigo: economicIndexDesc.codigo,
                                                                  nombre: economicIndexDesc.nombre,
                                                                  unidadMedida: economicIndexDesc.unidadMedida,
                                                                  fecha: economicIndexDesc.fecha,
                                                                  valor: economicIndexDesc.valor)
        return economicIndexDTO
    }
}

extension EconomicIndicesListPresenter: EILViewToEILPresenterProtocol {
    func logOut() {
        self.eilRouter?.logOut()
    }

    func getEconomicIndices() {
        self.eilInteractor?.requestEconomicIndices()
    }
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO) {
        eilRouter?.showEconomicIndexDetails(economicIndex: economicIndex)
    }
}

extension EconomicIndicesListPresenter: EILInteractorToEILPresenterProtocol {
    func economicIndicesRequestSuccess(economicIndices: EconomicIndicesEntity) {
        let economicIndexDTOs = economicIndices.getEconomicIndices().map{ economicIndex in
            self.createEconomicIndicesDTO(from: economicIndex)
        }
        self.eilView?.showEconomicIndices(economicIndices: economicIndexDTOs)
    }

    func economicIndicesRequestFail() {}
}

extension EconomicIndicesListPresenter: EILRouterToEILPresenterProtocol {
    
}
