//
//  Diary+CoreDataProperties.swift
//  01-diary
//
//  Copyright (c) 2023 Jeremy All rights reserved.    
//

import CoreData

extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var image: Data?
    @NSManaged public var iconImage: Data?
    @NSManaged public var text: String?
    @NSManaged public var tite: String?

}

extension Diary : Identifiable {

}
