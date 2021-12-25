//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class SignUpQsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var county: UITextField!
    @IBOutlet weak var commute: UITextField!
    @IBOutlet weak var transportPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.transportPicker.delegate = self
        self.transportPicker.dataSource = self
        
        pickerData = ["Electric Car", "Gas Car", "Public Transportation", "Bike"]
    
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "Second Sign Up") {
            if (county.text != "" && commute.text != "") {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }


}

