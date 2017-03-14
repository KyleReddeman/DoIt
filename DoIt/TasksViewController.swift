//
//  ViewController.swift
//  DoIt
//
//  Created by Kyle Reddeman on 3/13/17.
//  Copyright © 2017 Kyle Reddeman. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "goToAddViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskViewController" {
            let nextVC = segue.destination as! DetailedTaskViewController
            nextVC.task = sender as! Task
            nextVC.index = selectedIndex
            nextVC.previousVC = self
        }
        else {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "ShowTaskViewController", sender: tasks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(tasks[indexPath.row].name)"
        }
        else {
            cell.textLabel?.text = "\(tasks[indexPath.row].name)"
        }
        return cell;
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        let task2 = Task()
        let task3 = Task()
        
        task1.name = "pet dogs"
        task1.important = true
        task2.name = "eat"
        task3.name = "drink water"
        
        return [task1, task2, task3]
    }

}

