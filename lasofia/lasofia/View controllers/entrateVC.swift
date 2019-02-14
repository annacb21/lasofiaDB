//
//  entrateVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 09/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class entrateVC: UITableViewController, entrateModelDelegate {
    
    var EntrateModel = entrateModel()
    var entrate = [Entrata]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntrateModel.getItems()
        EntrateModel.delegate = self

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entrate.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entraCell", for: indexPath) as! entrateCell

        // Configure the cell...
        cell.costoLabel.text = entrate[indexPath.row].costo
        cell.codiceLabel.text = entrate[indexPath.row].codice
        cell.dataLabel.text = entrate[indexPath.row].data

        return cell
    }
 
    
    func itemsDownloaded(entrate: [Entrata]) {
        self.entrate = entrate
        tableView.reloadData()
    }

}
