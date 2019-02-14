//
//  newBevandaVC.swift
//  lasofia
//
//  Created by anna cisotto bertocco on 13/02/2019.
//  Copyright © 2019 CatCoding. All rights reserved.
//

import UIKit

class newBevandaVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var codiceField: UITextField!
    @IBOutlet weak var nomeField: UITextField!
    @IBOutlet weak var marcaField: UITextField!
    @IBOutlet weak var quantitaField: UITextField!
    @IBOutlet weak var annataField: UITextField!
    @IBOutlet weak var tipoField: UITextField!
    @IBOutlet weak var prezzoField: UITextField!
    @IBOutlet weak var fornitoreField: UITextField!
    
    //URL to our web service

    override func viewDidLoad() {
        super.viewDidLoad()
        
        codiceField.delegate = self
        nomeField.delegate = self
        marcaField.delegate = self
        quantitaField.delegate = self
        annataField.delegate = self
        tipoField.delegate = self
        prezzoField.delegate = self
        fornitoreField.delegate = self
        

    }
    
    //for the hiding keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func addBevanda(_ sender: Any) {
        
        
        //getting values from text fields
        let codice = codiceField.text
        let nome = nomeField.text
        let marca = marcaField.text
        let quantity = quantitaField.text
        let annata = annataField.text
        let tipo = tipoField.text
        let prezzo = prezzoField.text
        let fornitore = fornitoreField.text
        
        let urlString = "http://lasofiadb.altervista.org/newBevanda.php"
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        request.httpMethod = "POST"
        
        let postString = "CodiceBevanda=\(codice)&NomeBevanda=\(nome)&Marca=\(marca)&QuantitaBevanda=\(quantity)&Annata=\(annata)&Tipo=\(tipo)&PrezzoBevanda=\(prezzo)&Fornitore=\(fornitore)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            if (error == nil) {
                
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                
                //Execute UI code immediately
                print(result)
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                print(error!)
            }
        })
        task.resume()
        
    }
    

}
