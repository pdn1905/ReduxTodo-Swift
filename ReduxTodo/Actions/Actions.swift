//
//  Actions.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import ReSwift

struct AddTask: Action {
  var name: String
}
//MARK: Action
struct DeleteTask: Action {
  var index: Int
}
