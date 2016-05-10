//
//  NSManagedObject+ModelUtility.h
//  ModelUtility
//
//  Created by 任贵权 on 16/5/9.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (ModelUtility)

+ (instancetype)mu_modelWithClass:(Class)cls KeyValues:(NSDictionary *)JSONObject inContext:(NSManagedObjectContext *)context;

@end
