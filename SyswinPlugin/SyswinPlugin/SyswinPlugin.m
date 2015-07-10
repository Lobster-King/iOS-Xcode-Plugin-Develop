//
//  SyswinPlugin.m
//  SyswinPlugin
//
//  Created by qinzhiwei on 15/6/30.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "SyswinPlugin.h"

static SyswinPlugin *sharedPlugin;

@interface SyswinPlugin()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@property (nonatomic, strong)NSMutableSet *notificationSet;

@end

@implementation SyswinPlugin

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:nil object:nil];
        self.notificationSet = [NSMutableSet new];
        
        // Create menu items, initialize UI, etc.

        // Sample Menu Item:
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Do Action" action:@selector(doMenuAction) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
    }
    return self;
}

// Sample Action, for menu item:
- (void)doMenuAction
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, World"];
    [alert runModal];
}

- (void)handleNotification:(NSNotification *)notification{
    
    
    if (![self.notificationSet containsObject:notification.name ]) {
        
        NSLog(@"name:%@ ==== obj:%@",notification.name,notification.object);
        [self.notificationSet addObject:notification.name];
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
