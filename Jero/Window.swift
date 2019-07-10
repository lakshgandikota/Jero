//
//  Window.swift
//  Jero
//
//  Created by Laks Gandikota on 7/26/17.
//  Copyright © 2017 Laks Gandikota. All rights reserved.
//

import UIKit

class Window: UIWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        self.backgroundColor = UIColor.red
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func prepareDefaults() -> Void {
        //window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = UINavigationController(rootViewController: ViewController())
        //window?.makeKeyAndVisible()
    }

    
    
}

