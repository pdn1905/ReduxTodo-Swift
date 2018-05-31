//
//  AppState.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import ReSwift

struct AppState: StateType {
  var tasks: [Task] = []

  init(tasks: [Task]) {
    self.tasks = tasks
  }
}
