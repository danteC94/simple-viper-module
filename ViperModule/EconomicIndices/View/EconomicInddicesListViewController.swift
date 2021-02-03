//
//  EconomicInddicesListViewController.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import UIKit

class EconomicInddicesListViewController: UIViewController {

    var presenter: EILViewToEILPresenterProtocol?
    var economicIndexDTOs: [EconomicIndexDTO]?
    public var email: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.email
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(
            (UINib(
                nibName: "EconomicIndexTableViewCell",
                bundle: Bundle(for: EconomicIndexTableViewCell.self))),
            forCellReuseIdentifier: "EconomicIndexTableViewCell")
        self.presenter?.getEconomicIndices()
    }

    @IBOutlet weak var tableView: UITableView!
}

extension EconomicInddicesListViewController: EILPresenterToEILViewProtocol {
    func showEconomicIndices(economicIndices: [EconomicIndexDTO]) {
        self.economicIndexDTOs = economicIndices
        self.tableView.reloadData()
    }
}

extension EconomicInddicesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.economicIndexDTOs?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "EconomicIndexTableViewCell", for: indexPath) as? EconomicIndexTableViewCell else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in table view")
            return UITableViewCell()
        }
        guard let economicIndexDTO = self.economicIndexDTOs?[indexPath.row] else {
            assertionFailure("No economicIndex for row \(indexPath.row) in table view")
            return UITableViewCell()
        }

        let cellViewData = EconomicIndexTableViewCell.ViewData(name: economicIndexDTO.nombre,
                                                               value: economicIndexDTO.valor)
        cell.viewData = cellViewData
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let economicIndexDTO = self.economicIndexDTOs?[indexPath.row] else {
            assertionFailure("No economicIndexDTO for row \(indexPath.row) in table view")
            return
        }
        self.presenter?.showEconomicIndexDetails(economicIndex: economicIndexDTO)
    }
}
