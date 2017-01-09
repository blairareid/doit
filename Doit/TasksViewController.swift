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
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    // Will show up when a view controller show up
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    // when a tableview row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         selectedIndex = indexPath.row  // Track the row in the array
        
        let task=tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    // Establishes the number of rows in the TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // The list of rows in the tableview
        return tasks.count
    }

    
    // Called on the setup of each row in the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.boolImportant {
            cell.textLabel?.text = "! \(task.txtName!)"

        }
            else {
            // Need the exclamtion mark because core data treats as optional
            cell.textLabel?.text = task.txtName!
           
            }
        
        
        return cell
        
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
 
    func getTasks() {
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
       
        }
        
        
    }
    

    
}

