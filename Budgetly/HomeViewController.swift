//
//  HomeViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/15/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var monthlyBudgetImageView: UIImageView!
    @IBOutlet weak var budgetGuideImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthlyBudgetImageView.layer.cornerRadius = 10
        monthlyBudgetImageView.clipsToBounds = true
        budgetGuideImageView.layer.cornerRadius = 10
        budgetGuideImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func breakdownButtonTap(_ sender: Any) {
        print("this was tapped")
        self.tabBarController?.selectedIndex = 1
        
    }
    @IBAction func guideButtonTap(_ sender: Any) {
        print("this was tapped")
        self.tabBarController?.selectedIndex = 2
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
