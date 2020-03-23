//
//  ExpenseViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/15/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {

    @IBOutlet weak var spendingImageView: UIImageView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spendingImageView.layer.cornerRadius = 10
        spendingImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Breakdown"
    }
    
    @IBAction func seeAllExpenses(_ sender: Any) {
        performSegue(withIdentifier: "allExpensesSegue", sender: self)
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
