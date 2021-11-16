//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 08/11/2021.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var barChart: BarChartView = {
        let chartView = BarChartView()
        chartView.doubleTapToZoomEnabled = false
        chartView.rightAxis.enabled = false
        chartView.drawValueAboveBarEnabled = true
        chartView.maxVisibleCount = 7
        chartView.fitBars = true
        chartView.scaleXEnabled = true
        chartView.scaleYEnabled = false
        chartView.animate(xAxisDuration: 1.5)
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = UIFont.systemFont(ofSize: 12)
        xAxis.labelTextColor = UIColor.black
        xAxis.drawAxisLineEnabled = true
        xAxis.drawGridLinesEnabled = false
        xAxis.centerAxisLabelsEnabled = false
        xAxis.granularity = 1
        xAxis.drawLabelsEnabled = true
        
        let leftAxis = chartView.leftAxis
        leftAxis.axisMinimum = .zero
        leftAxis.drawGridLinesEnabled = true
        leftAxis.drawGridLinesEnabled = false
        leftAxis.granularityEnabled = true
        leftAxis.labelTextColor = UIColor.white

        chartView.legendRenderer.legend?.enabled = false
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Title"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: 120)
        barChart.center = view.center
        view.addSubview(barChart)
        
        let waitingTime = [30, 40, 50, 60, 70, -1]
        let storeValues = [103, 32.0, 39.0, 1.0, 2.0, 0.0]
        
        let barColors = waitingTime.map{ getColorTime($0)}
        let minValues = waitingTime.map{ getTimeLabel($0)}

        
        barChart.setBarChartData(xValues: minValues,
                                 yValues: storeValues,
                                 colors: barColors)
    }
    
    func getColorTime(_ time: Int) -> UIColor {
        if time < 0 {
            return UIColor.black
        } else if time == 30 {
            return UIColor.blue
        } else if time == 40 {
            return UIColor.yellow
        } else if time >= 50 {
            return UIColor.red
        } else {
            return UIColor.white
        }
    }
    
    func getTimeLabel(_ time: Int) -> String {
        if time == -1 {
            return "Stop"
        } else if time >= 70 {
            return ">70min"
        } else {
            return "\(time)min"
        }
    }
}

class DigitValueFormatter : NSObject, IValueFormatter {
    
    func stringForValue(_ value: Double,
                        entry: ChartDataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        if value == 0 {
            return ""
        } else {
            let valueWithoutDecimalPart = String(format: "%.0f", value)
            return "\(valueWithoutDecimalPart)"
        }
    }
}

extension BarChartView {
    
    private class BarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    func setBarChartData(xValues: [String], yValues: [Double], colors: [UIColor]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries)
        let chartData = BarChartData(dataSet: chartDataSet)
        
        let chartFormatter = BarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        chartDataSet.setColors(colors, alpha: 1)
        chartDataSet.valueFont = UIFont.systemFont(ofSize: 12)
        chartDataSet.valueFormatter = DigitValueFormatter()
        chartDataSet.highlightEnabled = false
        chartDataSet.label?.removeAll()
        chartDataSet.drawIconsEnabled = false
        chartData.barWidth = (Double(dataEntries.count)/10).truncatingRemainder(dividingBy: 1)
        self.data = chartData
    }
}

