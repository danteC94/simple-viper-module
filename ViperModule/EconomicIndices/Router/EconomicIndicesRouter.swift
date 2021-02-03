//
//  EconomicIndicesRouter.swift
//  ViperModule
//
//  Created by dante on 02/02/2021.
//

import UIKit

class EconomicIndicesRouter {
    weak var presenter: EILRouterToEILPresenterProtocol?
    var presentingViewController: UINavigationController?

    func createModule(navigationController: UINavigationController, userEmail: String) -> EconomicInddicesListViewController {
        self.presentingViewController = navigationController

        let view = EconomicInddicesListViewController(nibName: "EconomicInddicesListViewController", bundle: Bundle(for: EconomicInddicesListViewController.self))
        view.email = userEmail
        let presenter = EconomicIndicesListPresenter()
        let interactor = EconomicIndicesListInteractor()

        self.presenter = presenter
        view.presenter = presenter
        presenter.eilView = view
        presenter.eilRouter = self
        presenter.eilInteractor = interactor
        interactor.presenter = presenter

        return view
    }
}

extension EconomicIndicesRouter: EILPresenterToEILRouterProtocol {
    func logOut() {
        self.presentingViewController?.popViewController(animated: true)
    }
    
    func showEconomicIndexDetails(economicIndex: EconomicIndexDTO) {
        guard let presentingViewController = self.presentingViewController else { return }

        let view = EconomicIndexDetailViewController(nibName: "EconomicIndexDetailViewController", bundle: Bundle(for: EconomicIndexDetailViewController.self))
        _ = view.view
        view.economicIndexDTOs = economicIndex
        presentingViewController.pushViewController(view, animated: true)
    }
}
