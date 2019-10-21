//
//  TimeStampMO+CoreDataProperties.swift
//  CodeChallenge
//
//  Created by Kavya Muppidi on 18/10/19.
//  Copyright © 2019 Kavya Muppidi. All rights reserved.
//
//

import Foundation
import CoreData


extension TimeStampMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeStampMO> {
        return NSFetchRequest<TimeStampMO>(entityName: "TimeStampMO")
    }

    @NSManaged public var name: String?
    @NSManaged public var entryTime: String?
    @NSManaged public var exitTime: String?

}
