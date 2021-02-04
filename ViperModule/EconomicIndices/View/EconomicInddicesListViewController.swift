//
//  EconomicInddicesListViewController.swift
//  ViperModule
//
//  Created by dante on 01/02/2021.
//

import UIKit

class EconomicInddicesListViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)

    var presenter: EILViewToEILPresenterProtocol?
    var economicIndexDTOs: [EconomicIndexDTO]?
    var filteredEconomicIndices: [EconomicIndexDTO] = []
    public var email: String?
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.email
        self.navigationItem.setHidesBackButton(true, animated: true)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar por codigo"
        navigationItem.searchController = searchController
        definesPresentationContext = true

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
    @IBOutlet weak var signOut: UIButton! {
        didSet {
            signOut.backgroundColor = UIColor.init(red: 0,
                                                   green: 170/255,
                                                   blue: 70/255,
                                                   alpha: 1)
            signOut.titleLabel?.tintColor = .white
            signOut.layer.cornerRadius = 15
            signOut.setTitle("Finalizar sesion", for: .normal)
        }
    }
    @IBAction func signOutTapped(_ sender: Any) {
        presenter?.logOut()
    }
}

extension EconomicInddicesListViewController: EILPresenterToEILViewProtocol {
    func showEconomicIndices(economicIndices: [EconomicIndexDTO]) {
        self.economicIndexDTOs = economicIndices
        self.tableView.reloadData()
    }
}

extension EconomicInddicesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard isFiltering else { return self.economicIndexDTOs?.count ?? 0 }
        return filteredEconomicIndices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "EconomicIndexTableViewCell", for: indexPath) as? EconomicIndexTableViewCell else {
            assertionFailure("Could not dequeue cell for row \(indexPath.row) in table view")
            return UITableViewCell()
        }
        let economicIndices: [EconomicIndexDTO]? = self.isFiltering ? self.filteredEconomicIndices : economicIndexDTOs
        guard let economicIndexDTO = economicIndices?[indexPath.row] else {
            assertionFailure("No economicIndex for row \(indexPath.row) in table view")
            return UITableViewCell()
        }
        let cellViewData = EconomicIndexTableViewCell.ViewData(name: economicIndexDTO.nombre,
                                                               value: economicIndexDTO.valor)
        cell.viewData = cellViewData

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let economicIndices: [EconomicIndexDTO]? = self.isFiltering ? self.filteredEconomicIndices : economicIndexDTOs
        guard let economicIndexDTO = economicIndices?[indexPath.row] else {
            assertionFailure("No economicIndexDTO for row \(indexPath.row) in table view")
            return
        }
        self.presenter?.showEconomicIndexDetails(economicIndex: economicIndexDTO)
    }
}

extension EconomicInddicesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let text = searchBar.text else { return }
        filterContentForSearchText(text)
    }

    func filterContentForSearchText(_ searchText: String) {
        guard let economicIndexDTOs = self.economicIndexDTOs else { return }
        filteredEconomicIndices = economicIndexDTOs.filter { (economicIndex: EconomicIndexDTO) -> Bool in
            return economicIndex.codigo.lowercased().contains(searchText.lowercased())
        }

        tableView.reloadData()
    }
}
