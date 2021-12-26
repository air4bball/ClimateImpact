//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class RiskIndexViewController: UIViewController {
    
    @IBOutlet weak var indexBar: UIProgressView!
    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var highestRisk: UILabel!
    @IBOutlet weak var mediumRisk: UILabel!
    @IBOutlet weak var lowestRisk: UILabel!
    
    var typeOfRisk = ["Fire", "Drought", "Flood"]
    var riskIndex = [[5.3, 4, 4], [0, 2, 6], [2, 2, 6], [7.4, 0, 6], [3.8, 2, 4], [0, 1, 8], [4.4, 4, 4], [0, 0, 4], [5.5, 2, 4], [6.9, 2, 4], [0.4, 0, 6], [4.2, 0, 4], [0, 1, 2], [1.8, 0, 4], [6.7, 0, 2], [0, 2, 2,], [6.1, 1, 6], [5.4, 0, 4], [6.2, 0, 4], [5.4, 2, 6], [0, 1, 8], [5.3, 3, 4], [4.6, 0, 4], [2.7, 4, 6], [4.9, 0, 6], [1.2, 2, 4], [6.1, 2, 4], [4.2, 2, 6], [3.1, 0, 4], [1.2, 0, 4], [2.9, 1, 4], [1.5, 0, 6], [10, 1, 4], [1.5, 3, 6], [3.4, 3, 4], [5.4, 0, 4], [8.4, 0, 4], [0, 4, 4,], [0.4, 4, 6], [7.3, 1, 4], [0, 3, 6], [4.7, 0, 4], [5.6, 4, 4], [0, 3, 4], [7.3, 0, 6], [0, 0, 6], [6.9, 0, 6], [3.3, 4, 4], [3.1, 2, 6], [2, 4, 4], [0, 2, 8], [6.5, 0, 6], [3.6, 0, 6], [5.3, 0, 4], [3.6, 2, 2], [4.8, 0, 4], [1.8, 2, 6], [2.3, 0, 4]]
    
    var userCounty = DataSaverStruct.details.county
    
    override func viewDidLoad() {
        var sum: Double = 0.0
        super.viewDidLoad()
        for i in 0..<DataSaverStruct.details.counties.count {
            if (DataSaverStruct.details.counties[i] == userCounty) {
                var factors = ["", "", ""]
                for j in 0..<riskIndex[i].count {
                    sum += riskIndex[i][j]
                    factors[j] = typeOfRisk[j] + " (" + String(riskIndex[i][j]) + ")"
                }
                let avg: Float = round(Float(sum / 3) * 1000) / 1000.0
                indexBar.setProgress(avg / 10, animated: false)
                index.text = String(avg)
                
                var highest = riskIndex[i].max()
                var highestIndex = riskIndex[i].firstIndex(of: highest!)
                highestRisk.text = factors[highestIndex!]
                break
            }
        }
        
        
//        let highestCounty = DataSaverStruct.details.counties[avgIndexEachCountyOrdered.firstIndex(of: first)!]
//        let secondCounty = DataSaverStruct.details.counties[avgIndexEachCountyOrdered.firstIndex(of: second)!]
//        let thirdCounty = DataSaverStruct.details.counties[avgIndexEachCountyOrdered.firstIndex(of: third)!]
//        let fourthCounty = DataSaverStruct.details.counties[avgIndexEachCountyOrdered.firstIndex(of: fourth)!]
//        let fifthCounty = DataSaverStruct.details.counties[avgIndexEachCountyOrdered.firstIndex(of: fifth)!]
    }
    
    


}

