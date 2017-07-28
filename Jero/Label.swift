//
//  Label.swift
//  Jero
//
//  Created by Laks Gandikota on 7/26/17.
//  Copyright © 2017 Laks Gandikota. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyFormat()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyFormat()
    }
    
    func applyFormat() {
        self.text = "Test Label"
        self.textColor = UIColor.gray
    }
    
}
