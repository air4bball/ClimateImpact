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
    }
    
    


}

