//
//  ZWPlugin.h
//  ZWPlugin
//
//  Created by qinzhiwei on 15/6/19.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface ZWPlugin : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end