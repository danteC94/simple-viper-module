//
//  EconomicIndexDetailViewController.swift
//  ViperModule
//
//  Created by dante on 02/02/2021.
//

import UIKit

class EconomicIndexDetailViewController: UIViewController {
    var economicIndexDTOs: EconomicIndexDTO? {
        didSet {
            guard let economicIndexDTOs = economicIndexDTOs else { return }

            self.name.text = economicIndexDTOs.nombre
            self.code.text = economicIndexDTOs.codigo
            self.measurementUnit.text = economicIndexDTOs.unidadMedida
            self.date.text = economicIndexDTOs.fecha
            self.value.text = String(economicIndexDTOs.valor)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet weak var nameTitle: UILabel! {
        didSet {
            nameTitle.text = "Nombre"
            nameTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var name: UILabel! {
        didSet {
            name.numberOfLines = 0
        }
    }
    @IBOutlet weak var codeTitle: UILabel! {
        didSet {
            codeTitle.text = "Codigo"
            codeTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var code: UILabel! {
        didSet {
            code.numberOfLines = 0
        }
    }
    @IBOutlet weak var measurementUnitTitle: UILabel! {
        didSet {
            measurementUnitTitle.text = "Unidad de medida"
            measurementUnitTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var measurementUnit: UILabel! {
        didSet {
            measurementUnit.numberOfLines = 0
        }
    }
    @IBOutlet weak var dateTitle: UILabel! {
        didSet {
            dateTitle.text = "fecha"
            dateTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var date: UILabel! {
        didSet {
            date.numberOfLines = 0
        }
    }
    @IBOutlet weak var valueTitle: UILabel! {
        didSet {
            valueTitle.text = "valor"
            valueTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var value: UILabel! {
        didSet {
            value.numberOfLines = 0
        }
    }
}

