//
//  ViewController.m
//  OC Example
//
//  Created by 任贵权 on 16/5/10.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "UserInfo.h"
#import "ModelUtility/ModelUtility.h"
@import ModelUtility;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *JSON = @{@"id":@1,@"userInfo":@{@"name":@"isunimp",@"age":@22}};
    User *user = [User mu_modelWithKeyValues:JSON];
    
    NSLog(@"id: %@",user.id);
    NSLog(@"name: %@",user.userInfo.name);
    NSLog(@"age: %@",user.userInfo.age);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
