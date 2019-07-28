//
//  ViewController.swift
//  Jero
//
//  Created by Laksh Gandikota on 7/26/17.
//  Copyright © 2017 Laksh Gandikota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Nothing here. \nIts all in the Console logs."
        label.textAlignment = .center
        label.sizeToFit()
        label.textColor = .gray
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        self.navigationItem.title = "Background"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

