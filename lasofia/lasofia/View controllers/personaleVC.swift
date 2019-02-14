//
//  personaleVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class personaleVC: UITableViewController, personaModelDelegate {
    
    var PersonaModel = personaModel()
    var persone = [Personale]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PersonaModel.getItems()
        PersonaModel.delegate = self

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persone.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personaCell", for: indexPath) as! dipendenteCell

        // Configure the cell...
        cell.cfLabel.text = persone[indexPath.row].cf
        cell.cognomeLabel.text = persone[indexPath.row].cognome
        cell.nomeLabel.text = persone[indexPath.row].nome
        cell.ruoloLabel.text = persone[indexPath.row].ruolo
        cell.stipendioLabel.text = persone[indexPath.row].stipendio

        return cell
    }
    
    func itemsDownloaded(personale: [Personale]) {
        self.persone = personale
        tableView.reloadData()
    }

}
