//
//  HomeVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 08/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {
    
    let items = ["fornitori", "cibi", "bevande", "entrate", "uscite", "personale", "turni", "prenotazioni", "ordini"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: items[indexPath.row], sender: self)
    }

}
