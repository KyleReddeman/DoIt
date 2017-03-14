//
//  DetailedTaskViewController.swift
//  DoIt
//
//  Created by Kyle Reddeman on 3/14/17.
//  Copyright © 2017 Kyle Reddeman. All rights reserved.
//

import UIKit

class DetailedTaskViewController: UIViewController {

    @IBOutlet weak var taskNameLabel: UILabel!
    
    var task: Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task!.important {
            taskNameLabel.text! = "❗️\(task!.name!)"
        }
        else {
            taskNameLabel.text! = "\(task!.name!)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tappedComplete(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
