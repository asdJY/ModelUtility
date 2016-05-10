//
//  User.swift
//  Swift Examples
//
//  Created by 任贵权 on 16/5/10.
//  Copyright © 2016年 任贵权. All rights reserved.
//

import UIKit
import CoreData

class User: NSManagedObject {
    @NSManaged var id: NSNumber?
    @NSManaged var userInfo: UserInfo?
}