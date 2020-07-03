//
//  Developer+CoreDataProperties.swift
//  Developers
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//
//

import Foundation
import CoreData


extension Developer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Developer> {
        return NSFetchRequest<Developer>(entityName: "Developer")
    }

    @NSManaged public var username: String?
    @NSManaged public var imageD: Data?
    @NSManaged public var favo: Bool
    @NSManaged public var desription: String?
    @NSManaged public var loved: Bool

}
