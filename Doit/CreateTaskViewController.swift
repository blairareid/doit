//
//  CreateTaskViewController.swift
//  Doit
//
//  Created by Blair Reid on 2017-01-08.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        //Create Task
        let task = Task()
        
        task.txtName = taskNameTextField.text!
        task.boolImportant = importantSwitch.isOn
        
        // Add task to Task class
        
        previousVC.tasks.append(task)
        
        
        previousVC.tableView.reloadData()
        
        
        navigationController!.popViewController(animated: true)
    }

    
    
}
