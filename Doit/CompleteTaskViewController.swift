//
//  CompleteTaskViewController.swift
//  Doit
//
//  Created by Blair Reid on 2017-01-08.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

  
    var task : Task? = nil
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task!.boolImportant {
            taskLabel.text = "! \(task!.txtName!)"
            
        }
        else {
          taskLabel.text = task!.txtName!
            
        }
        
    }

    @IBAction func completeTapped(_ sender: Any) {
    
        // delete out of context
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back to previous screen
        navigationController!.popViewController(animated: true)
    }
   
}
