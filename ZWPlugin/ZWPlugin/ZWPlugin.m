//
//  ZWPlugin.m
//  ZWPlugin
//
//  Created by qinzhiwei on 15/6/19.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "ZWPlugin.h"

static ZWPlugin *sharedPlugin;

@interface ZWPlugin()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@property (nonatomic ,strong)NSMutableSet *notificationSet;

@end

@implementation ZWPlugin

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
        
        // Create menu items, initialize UI, etc.
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:nil object:nil];
        
        self.notificationSet = [NSMutableSet new];
        
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"个性编译头像"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Reset Logger"
                                                                    action:@selector(doMenuAction) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }

        
        }
    return self;
}

- (void)doMenuAction {
    [self.notificationSet removeAllObjects];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleNotification:(NSNotification *)notification{
    if (![self.notificationSet containsObject:notification.name]) {
        NSLog(@"%@ ==== %@",notification.name,notification.object);
        [self.notificationSet addObject:notification.name];
        
    }
    
}

@end
