//
//  ViewController.swift
//  ClimateImpact
//
//  Created by SrikarP on 12/24/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    @IBOutlet weak var Chart: LineChartView!
    
    
    
    var numbers = [Double](); // data
    var LineChartEntry = [ChartDataEntry]();
    
    func updateGraph(){
        
        for i in 0..<numbers.count{
            let value = ChartDataEntry(x:Double(i),y:numbers[i])
            LineChartEntry.append(value)
        }
        
        let line = LineChartDataSet(entries: LineChartEntry, label: "Number")
        line.colors = [NSUIColor.blue]
        
        let data = LineChartData()
        data.addDataSet(line)
        
        Chart.data = data
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var houses = [615077, 1778, 18450, 100033, 28065, 8068, 415919, 11423, 91105, 333769, 11041, 63315, 57895, 9592, 300377, 46645, 34745, 12788, 3561069, 50966, 113182, 10404, 40926, 85756, 5288, 14138, 142399, 55460, 54258, 1111227, 167134, 15864, 848597, 574438, 19438, 725896, 1224375, 401452, 245541, 122979, 279457, 158333, 678496, 106728, 2361, 24214, 158808, 205225, 182290, 34477, 27676, 8945, 150210, 31628, 291019, 78531, 78531, 28693]
        
        var index = -1
        for i in 0..<DataSaverStruct.details.counties.count{
            if DataSaverStruct.details.county == DataSaverStruct.details.counties[i]{
                index = i
                break
            }
        }
        // Do any additional setup after loading the view.
        
        let data = readDataFromCSV(fileName: "PredictedElectricity") ?? "3000"
        var lines = data.split(separator: "\r\n")
        
        
        var userData = DataSaverStruct.details.county;
        
        
        for var i in 0..<lines.count{
            var bigStr = lines[i]
            
            var arr = bigStr.split(separator: " ")
            
            
            
        
            
            if (arr[0] == userData){
                
                numbers = Array<Double>(stride(from: 1.0, through: 10.0, by: 1.0))
                
                for var j in 0...9{
                    var input = Double(arr[j+1])
                    
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
                    
                    
                    var distToTarget = 10.0 * 2.0*261.0
                    if (DataSaverStruct.details.transport == "Electric Car") {
                        distToTarget *= 0.3
                        distToTarget *= 0.85
                    } else {
                        distToTarget *= 0.12618
                        distToTarget *= 2.296
                    }
                    
                    
                    var vals = (input ?? 0.0) * 1000000.0 / Double(houses[index]) * 0.85
                    
                    numbers[j] = (vals + distToTarget + totalCarEnergy)/1000.0
                }
                
            }
            
        }
        
        
        
        
        
        updateGraph()
        
    }
    
    func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ";")
            result.append(columns)
        }
        return result
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

