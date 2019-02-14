//
//  entrateModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 09/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol entrateModelDelegate {
    func itemsDownloaded(entrate:[Entrata])
}

class entrateModel: NSObject {
    
    var delegate : entrateModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/entrate.php"
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
        
        var entrateArray = [Entrata]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let entrata = Entrata.init(codice: jsonDic["CodiceEntrata"]!, costo: jsonDic["Costo"]!, data: jsonDic["DataEntrata"]!)
                
                entrateArray.append(entrata)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(entrate: entrateArray)
            
            print(entrateArray)
            
        } catch {
            print("Error!")
        }
        
        
    }

}
