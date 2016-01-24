//
//  AppDelegate.m
//  iConnect
//
//  Created by Mallikarjun Patil on 1/23/16.
//  Copyright © 2016 Mallikarjun. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse setApplicationId:@"8iZ4ywjvDt6XWhVO9O2gsg3mGbjhhJ4gP0Ki45Sk"
                  clientKey:@"PX8Clf1njJsD5AHMv1FrgRYeYNBMhxrKJZDJVsho"];
    
    // Override point for customization after application launch.
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        
        [application registerUserNotificationSettings:[UIUserNotificationSettings
                                                       settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|
                                                       UIUserNotificationTypeSound categories:nil]];
    }
    
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.repeatInterval = kCFCalendarUnitMinute;
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
    //Male a call to parse to get the best suggested job
    [notification setAlertBody:@"iOS Developer"];
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
    //    NSMutableSet *categories= [[NSMutableSet alloc] init];
    //
    //    UIMutableUserNotificationAction *saveJobNotification = [[UIMutableUserNotificationAction alloc] init];
    //
    //    saveJobNotification.identifier = @"Save";
    //    saveJobNotification.title =NSLocalizedString(@"Save", @"Save Job");
    //    saveJobNotification.authenticationRequired = false;
    //    [saveJobNotification setActivationMode:UIUserNotificationActivationModeBackground];
    //    saveJobNotification.identifier=@"SaveJob";
    //
    //
    //    UIMutableUserNotificationCategory* notificationCategory = [[UIMutableUserNotificationCategory alloc] init];
    //    notificationCategory.identifier = @"SaveJob";
    //    [notificationCategory setActions:[NSArray arrayWithObject:saveJobNotification] forContext:UIUserNotificationActionContextDefault];
    //
    //    [categories addObject:notificationCategory];
    //
    //    // Configure other actions and categories and add them to the set...
    //
    //    UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:
    //                                            (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
    //                                                                             categories:categories];
    //
    //    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    //    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //
    //    notification.timeZone = [NSTimeZone defaultTimeZone];
    //    notification.alertTitle=@"HELLO";
    //    notification.category = @"SaveJob";
    //    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    
    
}

//    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
//        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:[NSSet setWithObject:notificationCategory]]];
//    }




- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
