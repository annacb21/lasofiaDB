//
//  customCell.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 09/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var ivaLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
