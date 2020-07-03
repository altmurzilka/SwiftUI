//
//  NewModel+CoreDataProperties.swift
//  Glue
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//
//

import Foundation
import CoreData


extension NewModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewModel> {
        return NSFetchRequest<NewModel>(entityName: "NewModel")
    }

    @NSManaged public var id: String?
    @NSManaged public var time: String?
    @NSManaged public var msg: String?
    @NSManaged public var day: String?
    @NSManaged public var author: String?
    @NSManaged public var image: Data?

}
