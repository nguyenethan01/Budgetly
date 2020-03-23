//
//  NewExpenseViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/22/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit
import Parse

class NewExpenseViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var categoryField: UITextField!
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let item = PFObject(className: "Items")
        item["name"] = nameField.text
        item["amount"] = amountField.text
        item["category"] = categoryField.text
        item["author"]=PFUser.current()
        
        item.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }else{
                print("error!")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
