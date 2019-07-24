//
//  TableViewController.swift
//  Jero
//
//  Created by Gandikota, Laksh on 7/12/19.
//  Copyright © 2019 Laks Gandikota. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var managedContext: NSManagedObjectContext!
    
    enum items: String, CaseIterable {
        case Loading
    }
    
    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.cellLayoutMarginsFollowReadableWidth = false
        navigationItem.title = "Core Data Log"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items.allCases[indexPath.row].rawValue
        
        return cell
        
    }
}

