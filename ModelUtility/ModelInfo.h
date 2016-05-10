//
//  ModelInfo.h
//  ModelUtility
//
//  Created by 任贵权 on 16/5/6.
//  Copyright © 2016年 任贵权. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelInfo : NSObject

@property (nonatomic, strong, readonly)NSArray * _Nonnull propertyNames;
@property (nonatomic, strong, readonly)NSArray * _Nonnull propertyTypes;
@property (nonatomic, strong, readonly)NSArray * _Nonnull propertyClasss;

- (_Nonnull instancetype)initWithClass:(_Nonnull Class)cls;

/**
 *  是否存在某一属性
 *
 *  @param name          属性名称
 *  @param locationIndex 如果存在设置其索引
 *
 *  @return 结果
 */
- (BOOL)isExistPropertyWithName:(NSString * _Nonnull)name locationIndex:(NSInteger * _Nonnull)locationIndex;

/**
 *  判断所传索引下的属性Class是否和所传Class一致
 *
 *  @param propertyIndex 属性索引
 *  @param cls           cls
 *
 *  @return 结果
 */
- (BOOL)propertyTypeisKindWith:(NSInteger)propertyIndex ofClass:(id _Nonnull)cls;

/**
 *  根据索引获取Class
 *
 *  @param locationIndex 索引
 *
 *  @return Class
 */
- (Class _Nonnull)propertyClassWithIndex:(NSInteger)locationIndex;
@end
