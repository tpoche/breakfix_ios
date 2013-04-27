//
//  ElixrAppDelegate.m
//  breakfix_ios
//
//  Created by Trent Poche on 4/26/13.
//  Copyright (c) 2013 Team Breakfix. All rights reserved.
//

#import "ElixrAppDelegate.h"
#import "ElixrUser.h"
#import <RestKit/RestKit.h>

@implementation ElixrAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    RKLogConfigureByName("RestKit/Network*", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    //let AFNetworking manage the activity indicator
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // Initialize HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://elixr-breakfix.herokuapp.com"];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    //we want to work with JSON-Data
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    // Initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // Setup our object mappings
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[ElixrUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"userID",
     @"first_name" : @"firstName",
     @"last_name" : @"lastName",
     @"salutation" : @"salutation",
     @"email" : @"email"
     }];

    // Register our mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                                     pathPattern:@"/prototype/users.json"
                                                                     keyPath:nil
                                                                     statusCodes:[NSIndexSet indexSetWithIndex:200]];
    [objectManager addResponseDescriptor:responseDescriptor];

    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
