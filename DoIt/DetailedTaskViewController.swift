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
    
    var previousVC = TasksViewController()
    var task: Task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task.important {
            taskNameLabel.text! = "❗️\(task.name)"
        }
        else {
            taskNameLabel.text! = "\(task.name)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tappedComplete(_ sender: AnyObject) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
