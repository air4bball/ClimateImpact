//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit

class FootprintIndexViewController: UIViewController {
    @IBOutlet weak var contributor: UILabel!
    
    @IBOutlet weak var footprintIndex: UILabel!
    
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
        
        var houses = [615077, 1778, 18450, 100033, 28065, 8068, 415919, 11423, 91105, 333769, 11041, 63315, 57895, 9592, 300377, 46645, 34745, 12788, 3561069, 50966, 113182, 10404, 40926, 85756, 5288, 14138, 142399, 55460, 54258, 1111227, 167134, 15864, 848597, 574438, 19438, 725896, 1224375, 401452, 245541, 122979, 279457, 158333, 678496, 106728, 2361, 24214, 158808, 205225, 182290, 34477, 27676, 8945, 150210, 31628, 291019, 78531, 78531, 28693]

        var index = -1
        for i in 0..<DataSaverStruct.details.counties.count{
            if DataSaverStruct.details.county == DataSaverStruct.details.counties[i]{
                index = i
                break
            }
        }

        let data = readDataFromCSV(fileName: "PredictedElectricity") ?? "3000"
        var lines = data.split(separator: "\r\n")

        var arr = lines[index].split(separator: " ")
        
        var val = Double(arr[1]) ?? 1.0 * 1000000.0 / Double(houses[index])*0.85
        
        
        
        
        var distToTarget = 10.0 * 2.0*261.0
        if (DataSaverStruct.details.transport == "Electric Car") {
            distToTarget *= 0.3
            distToTarget *= 0.85
        } else {
            distToTarget *= 0.12618
            distToTarget *= 2.296
        }
        
        var footprint = (totalCarEnergy + val + distToTarget)/1000.0
        
        var ind = footprint/36.0 * 10.0
        
        ind = round(footprint * 1000) / 1000.0
        footprintIndex.text = String(ind)
        
        if val > totalCarEnergy && val > distToTarget{
            contributor.text = "Electricity"
        } else if totalCarEnergy > val && totalCarEnergy > distToTarget {
            contributor.text = "Driving To Work"
        } else{
            contributor.text = "Driving To Amenities"
        }
        
        
    }
    
    func readDataFromCSV(fileName:String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    


}

