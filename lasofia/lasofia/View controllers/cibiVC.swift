//
//  cibiVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class cibiVC: UITableViewController, ciboModelDelegate {
    
    var CiboModel = ciboModel()
    var cibi = [Cibo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        CiboModel.getItems()
        CiboModel.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cibi.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ciboCell", for: indexPath) as! ciboCell

        // Configure the cell...
        cell.codiceLabel.text = cibi[indexPath.row].codice
        cell.fornitoreLabel.text = cibi[indexPath.row].fornitore
        cell.nomeLabel.text = cibi[indexPath.row].nome
        cell.prezzoLabel.text = cibi[indexPath.row].prezzo
        cell.quantitaLabel.text = cibi[indexPath.row].quantità
        cell.scadenzaLabel.text = cibi[indexPath.row].scadenza
        cell.tipoLabel.text = cibi[indexPath.row].tipo

        return cell
    }

    func itemsDownloaded(cibi: [Cibo]) {
        self.cibi = cibi
        tableView.reloadData()
    }
    
}
