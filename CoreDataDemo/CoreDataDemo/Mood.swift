//
//  Mood.swift
//  CoreDataDemo
//
//  Created by liyoucheng on 2019/3/15.
//  Copyright © 2019年 JZYI. All rights reserved.
//

import UIKit
import CoreData

final class Mood: NSManagedObject {

    @NSManaged fileprivate(set) var date: Date
    @NSManaged fileprivate(set) var colors: [UIColor]
}
