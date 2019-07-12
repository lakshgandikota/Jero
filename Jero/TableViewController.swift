//
//  TableViewController.swift
//  Jero
//
//  Created by Gandikota, Laksh on 7/12/19.
//  Copyright © 2019 Laks Gandikota. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    enum items: String, CaseIterable {
        case Option1
        case Option2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
