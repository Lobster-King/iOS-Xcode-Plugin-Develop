//
//  NSObject+MethodSwizzler.m
//  ZWPlugin
//
//  Created by qinzhiwei on 15/6/19.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "NSObject+MethodSwizzler.h"
// 1
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzler)


+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod
{
    //获取self class
    Class cls = [self class];
    //原始method
    Method originalMethod;
    //注入method
    Method swizzledMethod;
    
    // 2
    if (isClassMethod) {
        originalMethod = class_getClassMethod(cls, originalSelector);
        swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    } else {
        originalMethod = class_getInstanceMethod(cls, originalSelector);
        swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    }
    
    // 3
    if (!originalMethod) {
        NSLog(@"Error: originalMethod is nil, did you spell it incorrectly? %@", originalMethod);
        return;
    }
    
    // 4
    method_exchangeImplementations(originalMethod, swizzledMethod);
}
@end
