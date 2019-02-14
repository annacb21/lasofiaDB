//
//  ciboModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol ciboModelDelegate {
    func itemsDownloaded(cibi:[Cibo])
}

class ciboModel: NSObject {
    
    var delegate : ciboModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/cibo.php"
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
        
        var cibiArray = [Cibo]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let cibo = Cibo.init(codice: jsonDic["CodiceCibo"]!, nome: jsonDic["NomeCibo"]!, scadenza: jsonDic["DataScadenza"]!, quantità: jsonDic["QuantitaCibo"]!, tipo: jsonDic["Tipologia"]!, prezzo: jsonDic["PrezzoCibo"]!, fornitore: jsonDic["IvaFornitore"]!)
                
                cibiArray.append(cibo)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(cibi: cibiArray)
            
            print(cibiArray)
            
        } catch {
            print("Error!")
        }
        
        
    }
    
}
