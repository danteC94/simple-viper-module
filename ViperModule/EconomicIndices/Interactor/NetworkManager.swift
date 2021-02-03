//
//  NetworkManager.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import Foundation
import Alamofire

enum ApiURL: String {
    case mindicator = "https://www.mindicador.cl/api"
}

protocol NetworkManager {
    func getEconomicIndicesList(success: @escaping (_ economicIndices: EconomicIndicesEntity) -> Void, failure: @escaping () -> Void)
}

class AlamofireNetworkManager: NetworkManager {
    func getEconomicIndicesList(success: @escaping (_ economicIndices: EconomicIndicesEntity) -> Void, failure: @escaping () -> Void) {
        let request = AF.request(ApiURL.mindicator.rawValue)
        request.responseDecodable(of: EconomicIndicesEntity.self) { response in
            guard let economicIndices = response.value else {
                failure()
                return
            }
            success(economicIndices)
        }
    }
}
