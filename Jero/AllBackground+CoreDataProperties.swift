//
//  AllBackground+CoreDataProperties.swift
//  Jero
//
//  Created by Laksh Gandikota on 7/24/19.
//  Copyright © 2019 Laks Gandikota. All rights reserved.
//
//

import Foundation
import CoreData


extension AllBackground {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AllBackground> {
        return NSFetchRequest<AllBackground>(entityName: "AllBackground")
    }

    @NSManaged public var dt: Date?
    @NSManaged public var log: String?

}
