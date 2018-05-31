//
//  ViewController.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {

  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(type: TodoCell.self)
      tableView.estimatedRowHeight = 200
      tableView.rowHeight = UITableViewAutomaticDimension
    }
  }

  var tasks: [Task] = [] {
    didSet {
      self.tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    store.subscribe(self)
  }

  @IBAction func onClick(_ sender: Any) {
    showAddDialog() { (input:String?) in
      guard let taskName = input else {
        return
      }
      let addTaskAction = AddTask(name: taskName)
      store.dispatch(addTaskAction)
    }

  }

  func newState(state: AppState) {
    self.tasks = store.state.tasks
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(type: TodoCell.self, indexPath: indexPath) else { fatalError() }
    cell.taskNameLabel.text = self.tasks[indexPath.item].name
    cell.deleteActionHandler = {
      let deleteTaskAction = DeleteTask(index: indexPath.item)
      store.dispatch(deleteTaskAction)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}


