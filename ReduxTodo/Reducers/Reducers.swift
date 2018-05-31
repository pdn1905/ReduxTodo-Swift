//
//  Reducers.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import ReSwift

func appReducers(action: Action, state: AppState?) -> AppState {

  var state = state ?? AppState(tasks: [])

  switch action {

  case let addTask as AddTask:
    let task = Task(name: addTask.name)
    state.tasks.insert(task, at: 0)

  case let deleteTask as DeleteTask:
    state.tasks.remove(at: deleteTask.index)

  default:
    return state

  }
  
  return state
}
