//
//  Todo.swift
//  Todo
//
//  Created by neo on 21/7/16.
//  Copyright © 2016 pivotal-sg. All rights reserved.
//

import Foundation

class Todo: NSObject {

    // Properties

    var name: String

    init(name: String) {
        self.name = name
        super.init()
    }
}
