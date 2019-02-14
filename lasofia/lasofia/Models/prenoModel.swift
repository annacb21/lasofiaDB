//
//  prenoModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol prenoModelDelegate {
    func itemsDownloaded(prenotazioni:[Prenotazione])
}

class prenoModel: NSObject {
    
    var delegate : prenoModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/prenotazioni.php"
        //download the Json data
        let url = URL(string: serviceUrl)
        
        if let url = url {
            //create a URL session
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    //success
                    self.parseJson(data: data!)
                }
                else {
                    //error occurred
                    
                }
            }
            
            //start the task
            task.resume()
        }
        
    }
    
    //function to download Json data
    func parseJson(data:Data) {
        
        var prenoArray = [Prenotazione]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let pren = Prenotazione.init(codice: jsonDic["CodicePrenotazione"], coperti: jsonDic["NumeroCoperti"], cliente: jsonDic["Cliente"], giorno: jsonDic["Giorno"], ora: jsonDic["Ora"], tavolo: jsonDic["numeroTavolo"])
                
                prenoArray.append(pren)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(prenotazioni: prenoArray)
            
            print(prenoArray)
            
        } catch {
            print("Error!")
        }
        
        
    }


}
