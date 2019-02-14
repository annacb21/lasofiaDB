//
//  personaModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 12/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol personaModelDelegate {
    func itemsDownloaded(personale:[Personale])
}

class personaModel: NSObject {
    
    var delegate : personaModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/personale.php"
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
        
        var personeArray = [Personale]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let persona = Personale.init(cf: jsonDic["CodiceFiscale"]!, nome: jsonDic["Nome"]!, cognome: jsonDic["Cognome"]!, ruolo: jsonDic["Ruolo"]!, stipendio: jsonDic["Stipendio"]!)
                
                personeArray.append(persona)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(personale: personeArray)
            
            print(personeArray)
            
        } catch {
            print("Error!")
        }
        
        
    }

}
