//
//  NSObject+Rayrolling_DVTBezelAlertPanel.m
//  ZWPlugin
//
//  Created by qinzhiwei on 15/6/19.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "NSObject+Rayrolling_DVTBezelAlertPanel.h"
// 1
#import "NSObject+MethodSwizzler.h"
#import <Cocoa/Cocoa.h>

// 2
@interface NSObject ()

// 3
- (id)initWithIcon:(id)arg1 message:(id)arg2 parentWindow:(id)arg3 duration:(double)arg4;
@end

// 4
@implementation NSObject (Rayrolling_DVTBezelAlertPanel)

// 5
+ (void)load
{
    static dispatch_once_t onceToken;
    
    // 6
    dispatch_once(&onceToken, ^{
        
        [NSClassFromString(@"DVTBezelAlertPanel") swizzleWithOriginalSelector:@selector(initWithIcon:message:parentWindow:duration:) swizzledSelector:@selector(Rayrolling_initWithIcon:message:parentWindow:duration:) isClassMethod:NO];
    });
}

- (id)Rayrolling_initWithIcon:(id)arg1 message:(id)arg2 parentWindow:(id)arg3 duration:(double)arg4
{
//    Build Succeeded   Build Failed  Build Started
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"com.syswin.ZWPlugin"];
    NSImage *newImage = [bundle imageForResource:@"IMG_0770.JPG"];
    if (arg1 && [arg2 isEqualToString:@"Build Succeeded"]) {
        
        return [self Rayrolling_initWithIcon:newImage message:@"😀😀编译成功😀😀" parentWindow:arg3 duration:arg4];
        
    }else if (arg1 && [arg2 isEqualToString:@"Build Failed"]){
        
        return [self Rayrolling_initWithIcon:newImage message:@"😂😂编译失败😂😂" parentWindow:arg3 duration:arg4];
        
    }else if (arg1 && [arg2 isEqualToString:@"Build Started"]){
        return nil;
    }
    return [self Rayrolling_initWithIcon:arg1 message:arg2 parentWindow:arg3 duration:arg4];
}

@end
