//
//  ExpenseTableViewController.swift
//  Budgetly
//
//  Created by Mingjia Wang on 3/22/20.
//  Copyright © 2020 nguyenethan01. All rights reserved.
//

import UIKit
import Parse

class ExpenseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var expenses = [PFObject]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let currentUser = PFUser.current()
        
        let query = PFQuery(className: "Items")
        //.whereKey("author", equalTo: currentUser!)
        query.limit = 200
        print("making query")
//        query.findObjectsInBackground { (expenses, error) in
//            if expenses != nil {
//                self.expenses = expenses!
//                self.tableView.reloadData()
//            }
//        }
//        
        
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) items.")
                // Do something with the found objects
                for object in objects {
                    print(object.objectId as Any)
                }
                
                self.expenses = objects
                self.tableView.reloadData()
            
                print(self.expenses)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
        

        let item = self.expenses[indexPath.row]
        cell.titleLabel.text = item["name"] as? String
        cell.categoryLabel.text = item["category"] as? String
        cell.amountLabel.text = item["amount"] as? String
        
        return cell
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
