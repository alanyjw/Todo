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

    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo" {
            let todoVC = segue.destination as! TodoViewController

            if let selectedCell = sender {
                let indexPath = tableView.indexPath(for: selectedCell as! UITableViewCell)!
                let selectedTodo = todos[(indexPath as NSIndexPath).row]
                todoVC.todo = selectedTodo
            }
        }
    }

    @IBAction func unwindToTodoList(_ unwindSegue: UIStoryboardSegue) {
        let todoVC = unwindSegue.source as? TodoViewController

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // editing todo
            let newTodo = todoVC!.todo
            todos[(selectedIndexPath as NSIndexPath).row] = newTodo!

            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            // adding todo
            let newIndexPath = IndexPath(row: todos.count, section: 0)

            if let todo = todoVC!.todo {
                todos.append(todo)

                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }

    // UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath)
        let todo = todos[(indexPath as NSIndexPath).row]

        cell.textLabel?.text = todo.name

        return cell
    }
}

