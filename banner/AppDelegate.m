//
//  AppDelegate.m
//  banner
//
//  Created by xiayao on 16/9/30.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "AppDelegate.h"
#import "BannerNotice.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
//  后续可以加手势来处理点击事件
//{
//    Boolean tapGestureBool;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|
                                                                                        UIUserNotificationTypeAlert|
                                                                                        UIUserNotificationTypeSound
                                                                            categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //  横幅通知接口调用
    //  bannerWith为横幅通知显示的图片   bannerName 显示的标题   bannerContent推送消息的内容
    UIView *viewBanner = [BannerNotice bannerWith:[UIImage imageNamed:@"icon.png"]
                                       bannerName:@"迹伴"
                                    bannerContent:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
    
    [self.window.rootViewController.view addSubview:viewBanner];
}

//  横幅的点击事件
- (void)handleNotice:(UITapGestureRecognizer *)gesture
{
    
}


@end
