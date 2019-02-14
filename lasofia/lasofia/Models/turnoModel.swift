//
//  turnoModel.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

protocol turnoModelDelegate {
    func itemsDownloaded(turni:[Turno])
}

class turnoModel: NSObject {

    var delegate : turnoModelDelegate?
    
    func getItems() {
        
        //hit the we service url
        let serviceUrl = "http://lasofiadb.altervista.org/turni.php"
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
        
        var turniArray = [Turno]()
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            
            //loop through the json array
            for jsonResult in jsonArray {
                
                let jsonDic = jsonResult as! [String:String]
                let turno = Turno.init(codicef: jsonDic["CodiceFiscale"]!, data: jsonDic["DataTurno"]!)
                
                turniArray.append(turno)
            }
            
            //pass the fornArray back to delegate
            delegate?.itemsDownloaded(turni: turniArray)
            
            print(turniArray)
            
        } catch {
            print("Error!")
        }
        
        
    }
    
}
