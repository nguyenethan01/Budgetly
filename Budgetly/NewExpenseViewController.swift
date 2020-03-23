//
//  NewExpenseViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/22/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit
import Parse
import RSSelectionMenu

class NewExpenseViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var selectedNames: [String] = []
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let item = PFObject(className: "Items")
        item["name"] = nameField.text
        item["amount"] = amountField.text
        item["category"] = categoryLabel.text
        item["author"] = PFUser.current()
        
        item.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }else{
                print("error!")
            }
        }
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        
        let data: [String] = ["Education", "Insurance", "Food & Drink", "Entertainment", "Personal", "Subscriptions", "Travel", "Utilities, Mortgage, & Taxes", "Other"] 
        
        
        let menu = RSSelectionMenu(dataSource: data) { (cell, name, indexPath) in
            cell.textLabel?.text = name
        }
        
        menu.setSelectedItems(items: selectedNames) { (name, index, selected, selectedItems) in
            self.selectedNames = selectedItems
            if self.selectedNames.count > 0 {
                self.categoryLabel.text = self.selectedNames[0]
                    
            } 
        }
        
        menu.show(from: self)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
