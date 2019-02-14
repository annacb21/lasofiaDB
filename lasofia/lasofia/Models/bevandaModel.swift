//
//  cibiModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol bevandaModelDelegate {
    func itemsDownloaded(bevande:[Bevanda])
}

class bevandaModel: NSObject {
    
    var delegate : bevandaModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/bevande.php"
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
                    print(error!)
                    
                }
            }
            //start the task
            task.resume()
        }
        else {
            print("error in the url")
        }
        
    }
    
    //function to download Json data
    func parseJson(data:Data) {
        
        var bevandeArray = [Bevanda]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let bevanda = Bevanda.init(codice: jsonDic["CodiceBevanda"], nome: jsonDic["NomeBevanda"], marca: jsonDic["Marca"], quantità: jsonDic["QuantitaBevanda"], annata: jsonDic["Annata"], tipo: jsonDic["Tipo"], prezzo: jsonDic["PrezzoBevanda"], fornitore: jsonDic["Fornitore"]!)
                
                bevandeArray.append(bevanda)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(bevande: bevandeArray)
            
            print(bevandeArray)
            
        } catch {
            print("Error!")
        }
        
        
    }

}
