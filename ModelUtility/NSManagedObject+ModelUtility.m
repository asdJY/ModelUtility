//
//  NSManagedObject+ModelUtility.m
//  ModelUtility
//
//  Created by 任贵权 on 16/5/9.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import "NSManagedObject+ModelUtility.h"
#import "NSObject+ModelUtility.h"
#import "ModelUtilityMacro.h"
@import CoreData;

@implementation NSManagedObject (ModelUtility)

+ (instancetype)mu_modelWithClass:(Class)cls KeyValues:(NSDictionary *)JSONObject inContext:(NSManagedObjectContext *)context{
    Class clazz = cls ? cls : [self class];
    NSString *entityName = MUClassName(clazz);
    id model = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    [model mu_setValuesWithClass:cls keyValues:JSONObject inContext:context];
    return model;
}

@end