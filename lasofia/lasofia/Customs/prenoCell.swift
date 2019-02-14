//
//  prenoCell.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class prenoCell: UITableViewCell {
    
    @IBOutlet weak var codiceLabel: UILabel!
    @IBOutlet weak var personeLabel: UILabel!
    @IBOutlet weak var clienteLabel: UILabel!
    @IBOutlet weak var giornoLabel: UILabel!
    @IBOutlet weak var oraLabel: UILabel!
    @IBOutlet weak var tavoloLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
