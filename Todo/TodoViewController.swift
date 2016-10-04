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
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var todo: Todo?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let existingTodo = todo {
            nameTextField.text = existingTodo.name
            self.title = existingTodo.name
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender != nil) {
            let sender = sender as? UIBarButtonItem
            if sender === saveButton {
                todo = Todo(name: nameTextField.text ?? "")
            }
        }
    }
}
