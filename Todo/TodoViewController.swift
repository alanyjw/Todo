//
//  TodoViewController.swift
//  Todo
//
//  Created by neo on 21/7/16.
//  Copyright © 2016 pivotal-sg. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    // Properties
    @IBOutlet weak var nameTextField: UITextField!

    var todo: Todo?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let existingTodo = todo {
            nameTextField.text = existingTodo.name
            self.title = existingTodo.name
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        todo = Todo(name: nameTextField.text ?? "")
    }
}
