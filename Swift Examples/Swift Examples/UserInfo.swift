//
//  UserInfo.swift
//  Swift Examples
//
//  Created by 任贵权 on 16/5/10.
//  Copyright © 2016年 任贵权. All rights reserved.
//

import UIKit
import CoreData

class UserInfo: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var age: NSNumber?
}