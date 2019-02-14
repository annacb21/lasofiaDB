//
//  fornitoreModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 08/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol HomeModelDelegate {
    
    func itemsDownloaded(fornitori:[Fornitore])
    
}

class homeModel: NSObject {
    
    var delegate : HomeModelDelegate?

    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/service.php"
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
        
        var fornArray = [Fornitore]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let forn = Fornitore.init(partitaIva: jsonDic["PartitaIva"]!, nome: jsonDic["NomeAzienda"]!, telefono: jsonDic["Telefono"]!)
                
                fornArray.append(forn)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(fornitori: fornArray)
            
            print(fornArray)
            
        } catch {
            print("Error!")
        }
        
        
    }
    
}
