//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Blair Reid on 2017-01-08.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var previousVC = TasksViewController()
    var task = Task()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task.boolImportant {
            taskLabel.text = "! \(task.txtName)"
            
        }
        else {
          taskLabel.text = task.txtName
            
        }
        
    }

    @IBAction func completeTapped(_ sender: Any) {
    
        // Remove tapped entry from array on previous screen
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        
        //Force reload of tableview
        previousVC.tableView.reloadData()
        
        // Pop back to previous screen
        navigationController!.popViewController(animated: true)
    }
   
}
