//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let photo = UIImage(named: "Image-1")
        image = UIImageView(image: photo)
        
        
    }
    
    


}

