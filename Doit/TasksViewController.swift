//
//  TasksViewController.swift
//  Doit
//
//  Created by Blair Reid on 2017-01-07.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []  // Declaring array of Task objects
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()  // Load up the array of tasks
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }

    // Establishes the number of rows in the TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    // Called on the setup of each row in the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.boolImportant {
            cell.textLabel?.text = "! \(task.txtName)"

        }
            else {
            cell.textLabel?.text = task.txtName
           
            }
        
        
        return cell
        
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.txtName = "Walk the dog"
        task1.boolImportant = false

        let task2 = Task()
        task2.txtName = "Fire the gardner"
        task2.boolImportant = true
        
        let task3 = Task()
        task3.txtName = "Mow the lawn"
        task3.boolImportant = false
      
        return ([task1, task2, task3])
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        
        nextVC.previousVC = self
    }
    
}

