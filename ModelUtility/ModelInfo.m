//
//  ModelInfo.m
//  ModelUtility
//
//  Created by 任贵权 on 16/5/6.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import "ModelInfo.h"
@import CoreData;
@import ObjectiveC.runtime;

@implementation ModelInfo

- (instancetype)initWithClass:(Class)cls{
    self = [super init];
    if (self) {
        NSMutableArray *names  = [NSMutableArray new];
        NSMutableArray *types  = [NSMutableArray new];
        NSMutableArray *classs = [NSMutableArray new];
        [self analyzePropertyWithClass:cls each:^(NSString *name, NSString *type) {
            [names addObject:name];
            [types addObject:type];
            [classs addObject: NSClassFromString(type)];
        }];
        _propertyNames  = [NSArray arrayWithArray:names];
        _propertyTypes  = [NSArray arrayWithArray:types];
        _propertyClasss = [NSArray arrayWithArray:classs];
    }
    return self;
}

- (BOOL)isExistPropertyWithName:(NSString *)name locationIndex:(NSInteger *_Nonnull)locationIndex{
    for (NSInteger i = 0; i < self.propertyNames.count; ++i) {
        if ([self.propertyNames[i] isEqualToString:name]) {
            *locationIndex = i;
            return true;
        }
    }
    return false;
}

- (BOOL)propertyTypeisKindWith:(NSInteger)propertyIndex ofClass:(Class)cls{
    Class propertyClass =  [_propertyClasss objectAtIndex:propertyIndex];
    return [cls isSubclassOfClass:propertyClass];
}

- (Class)propertyClassWithIndex:(NSInteger)locationIndex{
    return _propertyClasss[locationIndex];
}


#pragma mark - 私有方法

/**
 *  分析属性名称和类型
 *
 *  @param cls   Class
 *  @param block 每分析出一个进行回调
 */
- (void)analyzePropertyWithClass:(Class)cls each:(void(^ __nonnull)(NSString *name, NSString *type))block{
    
    if (cls == [NSManagedObject class]) { return; }
    
    unsigned int pCount = 0;
    objc_property_t *propertys = class_copyPropertyList(cls, &pCount);
    for (NSInteger i = 0; i < pCount; ++i) {
        NSString *name;
        NSMutableString *type;
        objc_property_t property = propertys[i];
        const char *_name        = property_getName(property);
        const char *_type        = property_getAttributes(property);
        
        name = [NSString stringWithUTF8String:_name];
        type = [NSMutableString new];
        const char *c = _type;
        BOOL didStart = false;
        do {
            if (didStart) {
                if (*c == '"') {
                    break;
                }else{
                    NSString *temp = [NSString stringWithFormat:@"%c", *c];
                    [type appendString:temp];
                }
            }else{
                if (*c == '"') {
                    didStart = true;
                }
            }
            c++;
        } while (c != '\0');
        block(name, type);
    }
}

@end
