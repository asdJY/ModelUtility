//
//  NSObject+ModelUtility.h
//  ModelUtility
//
//  Created by 任贵权 on 16/5/9.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSObject (ModelUtility)

/**
 *  实例化并解析值
 *
 *  @param JSONObject JSON字典
 *
 *  @return Model对象
 */
+ (instancetype)mu_modelWithKeyValues:(NSDictionary *)JSONObject;

/**
 *  解析Model对象值  - 没有继承自NSManagedObject的类型 可以直接调用该方法解析
 *
 *  @param JSONObject JSON字典
 */
- (void)mu_setValuesWithKeyValues:(NSDictionary *)JSONObject;

/**
 *  解析Model对象值  - 继承自NSManagedObject的类型必须调用该方法解析
 *
 *  @param cls        由于继承自NSManagedObject的类型,使用[self class]获取到的Class都为NSManagedObject,所以在使用CoreData的时候需要手动指定其Class
 *  @param JSONObject JSON字典
 *  @param context    NSManagedObjectContext对象
 */
- (void)mu_setValuesWithClass:(Class)cls keyValues:(NSDictionary *)JSONObject inContext:(NSManagedObjectContext *)context;

@end
