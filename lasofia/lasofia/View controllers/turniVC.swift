//
//  turniVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class turniVC: UITableViewController, turnoModelDelegate {
    
    var TurnoModel = turnoModel()
    var turni = [Turno]()

    override func viewDidLoad() {
        super.viewDidLoad()

        TurnoModel.getItems()
        TurnoModel.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return turni.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "turnoCell", for: indexPath) as! turnoCell

        // Configure the cell...
        cell.dipLabel.text = turni[indexPath.row].codicef
        cell.giornoLabel.text = turni[indexPath.row].data

        return cell
    }
    
    func itemsDownloaded(turni: [Turno]) {
        self.turni = turni
        tableView.reloadData()
    }
    
    
}
