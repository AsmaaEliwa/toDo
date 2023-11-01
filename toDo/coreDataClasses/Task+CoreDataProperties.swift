//
//  Task+CoreDataProperties.swift
//  toDo
//
//  Created by asmaa gamal  on 01/11/2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var status: Bool
    @NSManaged public var user: User?

}

extension Task : Identifiable {

}
