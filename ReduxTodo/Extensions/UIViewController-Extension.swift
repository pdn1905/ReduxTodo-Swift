//
//  UIViewController-Extension.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/26/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAddDialog(actionHandler: ((_ text: String?) -> Void)? = nil) {
    let alert = UIAlertController(title: "Add Task", message: "Please enter the name below.", preferredStyle: .alert)
    alert.addTextField { (textField:UITextField) in
      textField.placeholder = "Task"
    }
    alert.addAction(UIAlertAction(title: "Add", style: .destructive, handler: { (action:UIAlertAction) in
      guard let textField =  alert.textFields?.first else {
        actionHandler?(nil)
        return
      }
      actionHandler?(textField.text)
    }))
    self.present(alert, animated: true, completion: nil)
  }
}
