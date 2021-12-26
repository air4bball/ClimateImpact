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
        // Do any additional setup after loading the view.
        updateGraph()
        
        let data = readDataFromCSV(fileName: "PredictedElectricity.csv") ?? "3000"
        let csvRows = csv(data: data)
        print("YAY: ", csvRows[1][1])
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

