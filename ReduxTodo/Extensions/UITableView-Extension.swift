//
//  UITableView-Extension.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/27/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellProtocol {
  static func getIdentifier() -> String
  static func getNib() -> UINib
}

extension TableViewCellProtocol where Self: UIView {
  static func getIdentifier() -> String {
    return String(describing: self)
  }
  static func getNib() -> UINib {
    return UINib(nibName: self.getIdentifier(), bundle: nil)
  }
}

extension UITableViewCell : TableViewCellProtocol { }
extension UITableView {
  func register<T:TableViewCellProtocol>(type: T.Type) {
    self.register(T.getNib(), forCellReuseIdentifier: T.getIdentifier())
  }

  func dequeueReusableCell<T:TableViewCellProtocol>(type: T.Type,indexPath: IndexPath) -> T? {
    guard let cell = self.dequeueReusableCell(withIdentifier: T.getIdentifier(), for: indexPath) as? T else { return nil }
    return cell
  }
}
