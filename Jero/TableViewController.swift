//
//  TableViewController.swift
//  Jero
//
//  Created by Gandikota, Laksh on 7/12/19.
//  Copyright © 2019 Laks Gandikota. All rights reserved.
//

import UIKit
import CoreBluetooth
import ConsoleLog

class TableViewController: UITableViewController {
    
    var centralManager: CBCentralManager!
    
    enum items: String, CaseIterable {
        case Searching
    }
    
    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.cellLayoutMarginsFollowReadableWidth = false
        navigationItem.title = "BT"
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


extension TableViewController: CBCentralManagerDelegate {
        
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("Central stats is unknown")
        case .resetting:
            print("State is resetting")
        case .unsupported:
            print("State is unsupported")
        case .unauthorized:
            print("State is unauthorized")
        case .poweredOff:
            print("State is Powered OFF")
        case .poweredOn:
            print("State is Powered On")
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        @unknown default:
            fatalError()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected")
        ConsoleLog.shared.warning("disconnected")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        
        ConsoleLog.shared.info("\(String(describing: peripheral.name)) \(peripheral.identifier) \(peripheral.state.rawValue) \(advertisementData) \(RSSI)")

        print(peripheral.description)

        //centralManager.stopScan()
    }


}

