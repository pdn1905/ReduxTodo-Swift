//
//  TodoCell.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/18/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

  var deleteActionHandler: (() -> Void)?

  @IBOutlet weak var taskNameLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    print("taskNameLabel")
  }

  @IBAction func deleteAction(_ sender: Any) {
    self.deleteActionHandler?()
  }
}
