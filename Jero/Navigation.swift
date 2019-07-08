//
//  Navigation.swift
//  Jero
//
//  Created by Laks Gandikota on 7/28/17.
//  Copyright © 2017 Laks Gandikota. All rights reserved.
//

import UIKit

class Navigation: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        displayTitle()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    func displayTitle() {
        
        print(#function)
        self.navigationBar.topItem?.title = "Prototype"
    }
    
}
