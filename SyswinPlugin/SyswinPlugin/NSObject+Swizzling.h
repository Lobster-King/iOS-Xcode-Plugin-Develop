//
//  NSObject+Swizzling.h
//  SyswinPlugin
//
//  Created by qinzhiwei on 15/6/30.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)swizzlingMehtodWithOriginSEL:(SEL)origin destSEL:(SEL)dest isClassMethod:(BOOL)isClassMehtod;

@end
