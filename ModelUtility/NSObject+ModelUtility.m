//
//  NSObject+ModelUtility.m
//  ModelUtility
//
//  Created by 任贵权 on 16/5/9.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import "NSObject+ModelUtility.h"
#import "ModelInfo.h"
#import "ModelUtilityMacro.h"

@implementation NSObject (ModelUtility)

+ (instancetype)mu_modelWithKeyValues:(NSDictionary *)JSONObject{
    id model = [self new];
    [model mu_setValuesWithKeyValues:JSONObject];
    return model;
}

- (void)mu_setValuesWithKeyValues:(NSDictionary *)JSONObject{
    [self mu_setValuesWithClass:nil keyValues:JSONObject inContext:nil];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types-discards-qualifiers"
- (void)mu_setValuesWithClass:(Class)cls keyValues:(NSDictionary *)JSONObject inContext:(NSManagedObjectContext *)context{
    if(!JSONObject || !self){ return; }
    Class modelObjectClass = cls ? cls : [self class];
    ModelInfo *modelInfo   = [[ModelInfo alloc] initWithClass:modelObjectClass];
    
    NSArray *JSONAllKeys   = [JSONObject allKeys];
    NSArray *JSONAllValues = [JSONObject allValues];
    NSInteger locationIndex = 0;
    
    [JSONAllKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         // 检查model中是否存在和JSON key同名属性
         if ([modelInfo isExistPropertyWithName:obj locationIndex:&locationIndex]){
             Class valueCls = [JSONAllValues[idx] class];
             NSString *selString = [NSString stringWithFormat:@"set%@:",MUCapitalized(obj)];
             if (![self respondsToSelector: NSSelectorFromString(selString)]) {
                 NSLog(@"ModelUtility:请在xcdatamodeld文件中为%@实体添加属性%@,否则该属性解析不成功",MUClassName(cls),obj);
             }else{
                 // 检查属性对应的类型 和 key对应的value类型是否一致
                 if ([modelInfo propertyTypeisKindWith:locationIndex ofClass:valueCls]){
                     [self setValue:JSONAllValues[idx] forKey:obj];
                 }else if ([valueCls isSubclassOfClass:[NSDictionary class]]){
                     Class propertyClass = modelInfo.propertyClasss[locationIndex];
                     id subObject = context ? [NSEntityDescription insertNewObjectForEntityForName:MUClassName(propertyClass)
                                                                         inManagedObjectContext:context]:[propertyClass new];
                     [subObject mu_setValuesWithClass:propertyClass keyValues:JSONAllValues[idx] inContext:context];
                     [self setValue:subObject forKey:obj];
                 }
             }
         }else{
             NSString *className = NSStringFromClass(cls);
             NSLog(@"ModelUtility:%@中不存在%@属性",className, obj);
         }
     }];
}
#pragma clang diagnostic end
@end