//
//  usciteVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class usciteVC: UITableViewController, uscitaModelDelegate {
    
    
    var UscitaModel = uscitaModel()
    var uscite = [Uscita]()

    override func viewDidLoad() {
        super.viewDidLoad()

        UscitaModel.getItems()
        UscitaModel.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return uscite.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uscCell", for: indexPath) as! uscitaCell

        // Configure the cell...
        cell.codiceLabel.text = uscite[indexPath.row].codice
        cell.causaleLabel.text = uscite[indexPath.row].causale
        cell.costoLabel.text = uscite[indexPath.row].costo
        cell.dataLabel.text = uscite[indexPath.row].data

        return cell
    }
    
    func itemsDownloaded(uscite: [Uscita]) {
        self.uscite = uscite
        tableView.reloadData()
    }

}
