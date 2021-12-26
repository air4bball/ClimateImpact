//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit
import SQLite3

class SignUpViewController: UIViewController {
    
   
    @IBOutlet weak var usernameEntry: UITextField!
    
    @IBOutlet weak var passwordEntry: UITextField!
    
    @IBOutlet weak var streetEntry: UITextField!
    
    @IBOutlet weak var cityEntry: UITextField!
    
    @IBOutlet weak var stateZipEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "First Sign Up") {
            if (usernameEntry.text != "" && passwordEntry.text != "" && streetEntry.text != "" && cityEntry.text != "" && stateZipEntry.text != "") {
                DataSaverStruct.details.street = streetEntry.text ?? ""
                DataSaverStruct.details.city = cityEntry.text ?? ""
                DataSaverStruct.details.stateZip = stateZipEntry.text ?? ""
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    
    
}

