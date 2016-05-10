//
//  ModelUtilityMacro.h
//  GitHub-iPhone
//
//  Created by 任贵权 on 16/5/9.
//  Copyright © 2016年 任贵权. All rights reserved.
//

@import Foundation;
#import <UIKit/UIKit.h>

#ifndef ModelUtilityMacro_h
#define ModelUtilityMacro_h

#endif

/**
 *  字符串第一个字母大写
 *
 *  @param string 源数组
 *
 *  @return 结果
 */
static inline NSString * MUCapitalized(NSString *string){
    NSInteger length  = [string lengthOfBytesUsingEncoding:NSASCIIStringEncoding];
    const char *chars = [string cStringUsingEncoding:NSASCIIStringEncoding];
    char *copyChars = malloc(length + 1);
    memset(copyChars, 0, length);
    //memcpy(copyChars, chars, length);
    copyChars[length] = '\0';
    while (length >= 0) {
        copyChars[length] = chars[length];
        length--;
    }
    if (*copyChars >= 97 && *copyChars <= 122){
        *copyChars -= 32;
    }
    NSString *result = [NSString stringWithCString:copyChars encoding:NSASCIIStringEncoding];
    free(copyChars);
    return result;
}

/**
 *  由于Swfit有模块的存在,Swift的Class都会加上项目名称为前缀,如果是Swift则省略前缀
 *
 *  @param cls class
 *
 *  @return 结果
 */
static inline NSString *MUClassName(Class cls){
    return [NSStringFromClass(cls) componentsSeparatedByString:@"."].lastObject;
}