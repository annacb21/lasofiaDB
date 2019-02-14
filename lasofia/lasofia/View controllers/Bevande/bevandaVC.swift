//
//  bevandaVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class bevandaVC: UITableViewController, bevandaModelDelegate {
    
    var BevandaModel = bevandaModel()
    var bevande = [Bevanda]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BevandaModel.getItems()
        BevandaModel.delegate = self
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bevande.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! bevandaCell

        // Configure the cell...
        cell.annataLabel.text = bevande[indexPath.row].annata
        cell.codiceLabel.text = bevande[indexPath.row].codice
        cell.fornitoreLabel.text = bevande[indexPath.row].fornitore
        cell.marcaLabel.text = bevande[indexPath.row].marca
        cell.nomeLabel.text = bevande[indexPath.row].nome
        cell.prezzoLabel.text = bevande[indexPath.row].prezzo
        cell.quantitaLabel.text = bevande[indexPath.row].quantità
        cell.tipoLabel.text = bevande[indexPath.row].tipo

        return cell
    }
    
    func itemsDownloaded(bevande: [Bevanda]) {
        self.bevande = bevande
        tableView.reloadData()
    }
    
}
