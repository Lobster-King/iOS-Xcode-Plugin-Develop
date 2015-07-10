//
//  NSObject+MethodSwizzler.h
//  ZWPlugin
//
//  Created by qinzhiwei on 15/6/19.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzler)
//利用runtime机制动态注入
+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod;

@end
