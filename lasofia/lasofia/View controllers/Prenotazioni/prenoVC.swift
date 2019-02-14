//
//  prenoVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class prenoVC: UITableViewController, prenoModelDelegate {
    
    
    var PrenoModel = prenoModel()
    var prenos = [Prenotazione]()

    override func viewDidLoad() {
        super.viewDidLoad()

        PrenoModel.getItems()
        PrenoModel.delegate = self
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return prenos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prenCell", for: indexPath) as! prenoCell

        // Configure the cell...
        cell.clienteLabel.text = prenos[indexPath.row].cliente
        cell.codiceLabel.text = prenos[indexPath.row].codice
        cell.giornoLabel.text = prenos[indexPath.row].giorno
        cell.oraLabel.text = prenos[indexPath.row].ora
        cell.personeLabel.text = prenos[indexPath.row].coperti
        cell.tavoloLabel.text = prenos[indexPath.row].tavolo

        return cell
    }
    
    func itemsDownloaded(prenotazioni: [Prenotazione]) {
        self.prenos = prenotazioni
        tableView.reloadData()
    }
    
}
