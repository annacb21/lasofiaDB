//
//  uscitaModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol uscitaModelDelegate {
    func itemsDownloaded(uscite:[Uscita])
}

class uscitaModel: NSObject {

    var delegate : uscitaModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/uscite.php"
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
        
        var usciteArray = [Uscita]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let uscita = Uscita.init(codice: jsonDic["CodiceUscita"]!, causale: jsonDic["Causale"]!, data: jsonDic["DataUscita"]!, costo: jsonDic["Costo"]!)
                
                usciteArray.append(uscita)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(uscite: usciteArray)
            
            print(usciteArray)
            
        } catch {
            print("Error!")
        }
        
        
    }

    
}
