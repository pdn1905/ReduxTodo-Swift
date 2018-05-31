//
//  ReduxTodoTests.swift
//  ReduxTodoTests
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import XCTest
import ReSwift

@testable import ReduxTodo

class ReduxTodoTests: XCTestCase {
  
  func testAddTask() {
    let store = Store<AppState>(reducer: appReducers,state: AppState(tasks: [])) // Khởi tạo store với empty tasks
    
    store.dispatch(AddTask(name: "Work"))
    
    store.dispatch(AddTask(name: "Eat"))
    
    XCTAssertEqual(store.state.tasks.count, 2)
  }
  
  func testRemoveTask() {
    let store = Store<AppState>(reducer: appReducers,state: AppState(tasks: [Task(name: "Sing")])) // Khởi tạo store với 1 task
    
    store.dispatch(DeleteTask(index: 0))
    
    XCTAssertEqual(store.state.tasks.isEmpty, true)
    
  }
  
}
