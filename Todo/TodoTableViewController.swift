//
//  ViewController.swift
//  Todo
//
//  Created by neo on 19/7/16.
//  Copyright © 2016 pivotal-sg. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todos = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo" {
            let todoVC = segue.destinationViewController as! TodoViewController

            if let selectedCell = sender {
                let indexPath = tableView.indexPathForCell(selectedCell as! UITableViewCell)!
                let selectedTodo = todos[indexPath.row]
                todoVC.todo = selectedTodo
            }
        }
    }

    @IBAction func unwindToTodoList(unwindSegue: UIStoryboardSegue) {
        let todoVC = unwindSegue.sourceViewController as? TodoViewController

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // editing todo
            let newTodo = todoVC!.todo
            todos[selectedIndexPath.row] = newTodo!

            tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
        } else {
            // adding todo
            let newIndexPath = NSIndexPath(forRow: todos.count, inSection: 0)

            if let todo = todoVC!.todo {
                todos.append(todo)

                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

    // UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoTableViewCell", forIndexPath: indexPath)
        let todo = todos[indexPath.row]

        cell.textLabel?.text = todo.name

        return cell
    }
}

