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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        //Create Task within core data
        
        // Setups access to coredata container
       let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.txtName = taskNameTextField.text!
        task.boolImportant = importantSwitch.isOn
        
        // Save row
       (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        // Pop Back to previous view controller
        
        navigationController!.popViewController(animated: true)
    }

    
    
}
