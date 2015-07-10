//
//  SyswinPlugin.h
//  SyswinPlugin
//
//  Created by qinzhiwei on 15/6/30.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface SyswinPlugin : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end