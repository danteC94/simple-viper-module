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
            nameTitle.text = "Name"
        }
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var codeTitle: UILabel! {
        didSet {
            codeTitle.text = "Codigo"
        }
    }
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var measurementUnitTitle: UILabel! {
        didSet {
            measurementUnitTitle.text = "Unidad de medida"
        }
    }
    @IBOutlet weak var measurementUnit: UILabel!
    @IBOutlet weak var dateTitle: UILabel! {
        didSet {
            dateTitle.text = "fecha"
        }
    }
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var valueTitle: UILabel! {
        didSet {
            valueTitle.text = "valor"
        }
    }
    @IBOutlet weak var value: UILabel!

}

