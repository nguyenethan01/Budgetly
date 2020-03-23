//
//  ExpenseViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/15/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit
import Charts
import Parse

class ExpenseViewController: UIViewController {

    @IBOutlet weak var spendingImageView: UIImageView!

    @IBOutlet weak var pieChart: PieChartView!
    
    var items = [PFObject]()
    var curr = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //find current date
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        //set up queries
        let query = PFQuery(className: "Items")
        query.whereKey("author",equalTo: PFUser.current())
        query.whereKey("month",equalTo: nameOfMonth)
        query.findObjectsInBackground { (items, error) in
            if items != nil{
                for i in items!{
                    let temp = i["amount"] as! String
                    let val = Double(temp)
      
                    let label = i["category"]
                    self.curr.append(PieChartDataEntry(value: val ?? 0, label: (label as! String)))
                }
                let dataSet = PieChartDataSet(entries:self.curr, label: "categories")
                let data = PieChartData(dataSet:dataSet)
                self.pieChart.data = data
                self.pieChart.chartDescription?.text = "Expenses"
                dataSet.colors = ChartColorTemplates.joyful()
                dataSet.valueColors = [UIColor.black]
                self.pieChart.legend.font = UIFont(name: "Futura", size: 10)!

            }
        }
        
        
        
        
        
        spendingImageView.layer.cornerRadius = 10
        spendingImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Breakdown"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
