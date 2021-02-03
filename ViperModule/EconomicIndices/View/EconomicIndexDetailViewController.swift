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
            nameTitle.text = "Codigo"
        }
    }
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var measurementUnitTitle: UILabel! {
        didSet {
            nameTitle.text = "Unidad de medida"
        }
    }
    @IBOutlet weak var measurementUnit: UILabel!
    @IBOutlet weak var dateTitle: UILabel! {
        didSet {
            nameTitle.text = "fecha"
        }
    }
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var valueTitle: UILabel! {
        didSet {
            nameTitle.text = "valor"
        }
    }
    @IBOutlet weak var value: UILabel!

}

