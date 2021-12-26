//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class FootprintIndexViewController: UIViewController {
    @IBOutlet weak var contributor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var totalCarEnergy: Double = Double(DataSaverStruct.details.commuteTime) * 2.0 * 261.0
        if (DataSaverStruct.details.transport == "Electric Car") {
            totalCarEnergy *= 0.3
            totalCarEnergy *= 0.85
        } else if (DataSaverStruct.details.transport == "Bike") {
            totalCarEnergy = 0
        } else {
            totalCarEnergy *= 0.12618
            totalCarEnergy *= 2.296
        }
        
    }
    
    


}

