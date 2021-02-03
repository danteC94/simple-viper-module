//
//  EconomicIndexTableViewCell.swift
//  ViperModule
//
//  Created by dante on 02/02/2021.
//

import UIKit

class EconomicIndexTableViewCell: UITableViewCell {

    struct ViewData {
        let name: String
        let value: Float
    }

    var viewData: ViewData? {
        didSet {
            guard let viewData = viewData else { return }
            self.name.text = viewData.name
            self.value.text = String(viewData.value)
        }
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

    @IBOutlet weak var valueTitle: UILabel! {
        didSet {
            valueTitle.text = "Valor"
            valueTitle.font = .boldSystemFont(ofSize: 20)
        }
    }
    @IBOutlet weak var value: UILabel! {
        didSet {
            value.numberOfLines = 0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
