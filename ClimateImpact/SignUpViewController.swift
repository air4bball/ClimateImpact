//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var stateAndZip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
//    @IBAction func ShowPWD(_ sender: UIButton) {
//        pwd.isSecureTextEntry.toggle()
//    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        if (username.text == "" || password.text == "") {
            
        } else {
            performSegue(withIdentifier: "First Sign Up", sender: nil)
        }
    }
    
    
    
}

