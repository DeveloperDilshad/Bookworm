//
//  Book+CoreDataProperties.swift
//  
//
//  Created by Dilshad P on 23/12/24.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var genre: String?
    @NSManaged public var id: UUID?
    @NSManaged public var rating: Int16
    @NSManaged public var review: String?
    @NSManaged public var title: String?

}

extension Book : Identifiable {

}
