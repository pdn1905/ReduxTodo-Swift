//
//  AppDelegate.swift
//  ReduxTodo
//
//  Created by Ngoc Duong Phan on 5/15/18.
//  Copyright © 2018 NgocPhan. All rights reserved.
//

import UIKit
import ReSwift

let store = Store<AppState>(reducer: appReducers, state: AppState(tasks: []))

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  }

}

