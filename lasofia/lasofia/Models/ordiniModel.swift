//
//  ordiniModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol ordiniModelDelegate {
    func itemsDownloaded(ordini:[Ordine])
}

class ordiniModel: NSObject {
    
    var delegate : ordiniModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/ordini.php"
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
        
        var ordiniArray = [Ordine]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let ordine = Ordine.init(codice: jsonDic["CodiceOrdine"]!, persone: jsonDic["NumeroPersone"]!, giorno: jsonDic["Giorno"]!, ora: jsonDic["Ora"]!, conto: jsonDic["ContoTotale"]!, tavolo: jsonDic["NumeroTavolo"]!, cameriere: jsonDic["CodiceCameriere"]!)
                
                ordiniArray.append(ordine)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(ordini: ordiniArray)
            
            print(ordiniArray)
            
        } catch {
            print("Error!")
        }
        
        
    }

}
