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
    var Allog: [NSManagedObject] = []
    
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

        tableView.register(Cell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.cellLayoutMarginsFollowReadableWidth = false
        
        navigationItem.title = "Core Data Log"
        //save(name: "Fourth log test")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

            //appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AllBackground")
        
        do {
          Allog = try managedContext.fetch(fetchRequest)
          print(Allog.count)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    func save(name: String) {

        let entity = NSEntityDescription.entity(forEntityName: "AllBackground", in: managedContext)!
        let blog = NSManagedObject(entity: entity, insertInto: managedContext)
        blog.setValue(name, forKeyPath: "log")
        blog.setValue(Date(), forKey: "dt")
        do {
          try managedContext.save()
          Allog.append(blog)
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Allog.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let alog = Allog[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = alog.value(forKeyPath: "log") as? String
        
        let insertedDate: Date?
        insertedDate = alog.value(forKey: "dt") as? Date
        print(insertedDate?.preciseLocalTime ?? "")
        cell.detailTextLabel?.text = insertedDate?.preciseLocalTime ?? "NA"
        return cell
        
    }
}


class Cell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Formatter {
    // create static date formatters for your date representations
    static let preciseLocalTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
    
    static let preciseGMTTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
}
extension Date {
    // you can create a read-only computed property to return just the nanoseconds from your date time
    var nanosecond: Int { return Calendar.current.component(.nanosecond,  from: self)   }
    // the same for your local time
    var preciseLocalTime: String {
        return Formatter.preciseLocalTime.string(for: self) ?? ""
    }
    // or GMT time
    var preciseGMTTime: String {
        return Formatter.preciseGMTTime.string(for: self) ?? ""
    }
}

