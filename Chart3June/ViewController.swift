//
//  ViewController.swift
//  Chart3June
//
//  Created by CSPC106 on 03/06/19.
//  Copyright © 2019 CSPC106. All rights reserved.
//

import UIKit
import Charts


class ViewController: UIViewController {

    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var textAddValue: UITextField!
    
    var numbers : [Double] = [1,2,3,4,5,6,7] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGraph()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// This is the button trigger
    ///
    /// - Parameter sender: Sender
    @IBAction func btnbutton(_ sender: Any) {
        let input  = Double(textAddValue.text!) //gets input from the textbox - expects input as double/int
        numbers.append(input!) //here we add the data to the array.
        updateGraph()
    }
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        //here is the for loop
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        var labels = ["M","T","W","T","F","S","S"]
//        var count = 0
//        for i in 0..<labels.count {
//            if numbers.count > i {
//
//            } else {
//                labels.remove(at: i-count)
//                count+=1
//            }
//        }
//
//        print(labels)
      let line1 = LineChartDataSet(entries: lineChartEntry, label: nil) //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        line1.drawCirclesEnabled = false
        chartView.rightAxis.enabled = false
        
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
//        chartView.scaleXEnabled = true
//        chartView.scaleYEnabled = false
        
        
        chartView.xAxis.gridColor =  .clear
        chartView.rightAxis.gridColor = .clear
        chartView.leftAxis.gridColor = .clear
        chartView.xAxis.axisLineColor = .clear
        chartView.leftAxis.axisLineColor = .clear
        chartView.rightAxis.axisLineColor = .clear
        chartView.xAxis.gridColor = .clear
        chartView.leftAxis.gridColor = .clear
        chartView.rightAxis.gridColor = .clear
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        chartView.xAxis.labelPosition = .bottom
      
         let data = LineChartData() //This is the object that will be added to the chart
       
        
         data.addDataSet(line1) //Adds the line to the dataSet
         chartView.data = data //finally - it adds the chart data to the chart and causes an update
 
        //chartView.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
        
    }
    
    
    
}


