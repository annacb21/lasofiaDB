//
//  ordiniVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class ordiniVC: UITableViewController, ordiniModelDelegate {
    
    var OrdiniModel = ordiniModel()
    var ordini = [Ordine]()

    override func viewDidLoad() {
        super.viewDidLoad()

        OrdiniModel.getItems()
        OrdiniModel.delegate = self 
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ordini.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordineCell", for: indexPath) as! ordineCell

        // Configure the cell...
        cell.codiceLabel.text = ordini[indexPath.row].codice
        cell.cameriereLabel.text = ordini[indexPath.row].cameriere
        cell.contoLabel.text = ordini[indexPath.row].conto
        cell.giornoLabel.text = ordini[indexPath.row].giorno
        cell.oraLabel.text = ordini[indexPath.row].ora
        cell.personeLabel.text = ordini[indexPath.row].persone
        cell.tavoloLabel.text = ordini[indexPath.row].tavolo

        return cell
    }
    
    func itemsDownloaded(ordini: [Ordine]) {
        self.ordini = ordini
        tableView.reloadData()
    }
    

}
