//
//  fornitoriVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 08/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class fornitoriVC: UITableViewController, HomeModelDelegate {
    
    var HomeModel = homeModel()
    var fornitori = [Fornitore]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //call the download of the forn data
        HomeModel.getItems()
        HomeModel.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fornitori.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fornCell", for: indexPath) as! customCell

        // Configure the cell...
        cell.nomeLabel.text = fornitori[indexPath.row].nome
        cell.ivaLabel.text = fornitori[indexPath.row].partitaIva
        cell.telLabel.text = fornitori[indexPath.row].telefono

        return cell
    }

    
    func itemsDownloaded(fornitori: [Fornitore]) {
    
        self.fornitori = fornitori
        tableView.reloadData()
        
    }

}
