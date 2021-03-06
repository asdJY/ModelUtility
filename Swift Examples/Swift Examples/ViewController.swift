//
//  ViewController.swift
//  Swift Examples
//
//  Created by 任贵权 on 16/5/10.
//  Copyright © 2016年 任贵权. All rights reserved.
//

import UIKit
import ModelUtility

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let objectContext = appDelegate.managedObjectContext
        let JSON = ["id":1,"userInfo":["name":"isunimp","age":22]]
        let user =  User.mu_modelWithClass(User.self, keyValues: JSON, inContext: objectContext)
        
        print("id:\(user.id)")
        print("name:\(user.userInfo?.name)")
        print("age:\(user.userInfo?.age)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

