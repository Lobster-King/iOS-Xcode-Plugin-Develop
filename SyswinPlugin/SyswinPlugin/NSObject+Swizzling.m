//
//  NSObject+Swizzling.m
//  SyswinPlugin
//
//  Created by qinzhiwei on 15/6/30.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)swizzlingMehtodWithOriginSEL:(SEL)origin destSEL:(SEL)dest isClassMethod:(BOOL)isClassMehtod{
    
    Class cls = [self class];
    
    Method originMethod = NULL;
    Method destMethod = NULL;
    
    if (isClassMehtod) {
        originMethod = class_getClassMethod(cls, origin);
        destMethod = class_getClassMethod(cls, dest);
    }else{
        originMethod = class_getInstanceMethod(cls, origin);
        destMethod = class_getInstanceMethod(cls, dest);
    }

    method_exchangeImplementations(originMethod, destMethod);
    
    
}

@end
