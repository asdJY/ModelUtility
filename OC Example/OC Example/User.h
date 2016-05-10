//
//  User.h
//  OC Example
//
//  Created by 任贵权 on 16/5/10.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface User : NSObject

@property (nonatomic, strong)NSNumber *id;
@property (nonatomic, strong)UserInfo *userInfo;

@end
