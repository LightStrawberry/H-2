//
//  Step+CoreDataProperties.swift
//  H2
//
//  Created by 谭雅威 on 15/10/25.
//  Copyright © 2015年 songguo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Step {

    @NSManaged var stepCount: Int16
    @NSManaged var date: NSDate

}
