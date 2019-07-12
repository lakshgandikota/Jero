//
//  Tabs.swift
//  Jero
//
//  Created by Laksh Gandikota on 7/27/17.
//  Copyright © 2017 Laksh Gandikota. All rights reserved.
//

import UIKit

struct Tabs {
    
    var tmp0ViewController: UITableViewController?
    var tmp1ViewController: ViewController?
    var tmp2ViewController: ViewController?
    
    var viewControllerList: [Any]
    
    init() {

        tmp0ViewController = TableViewController()
        //tmp0ViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        //tmp0ViewController?.view.backgroundColor = UIColor.red
        
        tmp1ViewController = ViewController()
        tmp1ViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        tmp1ViewController?.view.backgroundColor = UIColor.green
        
        tmp2ViewController = ViewController()
        tmp2ViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        tmp2ViewController?.view.backgroundColor = UIColor.white
        
        viewControllerList = [UINavigationController(rootViewController: tmp0ViewController!), UINavigationController(rootViewController: tmp1ViewController!), UINavigationController(rootViewController: tmp2ViewController!)]

        tmp0ViewController?.navigationItem.title = "Prototype"

        
        
    }
    
}
