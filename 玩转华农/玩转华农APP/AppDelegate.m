//
//  AppDelegate.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/2/28.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "AppDelegate.h"
#import "SignInViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EMOptions *options = [EMOptions optionsWithAppkey:@"2014317200120#play"];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    
    
    BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
    if (!isAutoLogin) {
        EMError *error = [[EMClient sharedClient] registerWithUsername:@"8001" password:@"111111"];
        [[EMClient sharedClient].options setIsAutoLogin:YES];
        NSLog(@"kjjj");
    }
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
   if([defaults objectForKey:@"name"]==nil){
      SignInViewController *signIn=[[SignInViewController alloc] init];
        self.window.rootViewController=signIn;
    }
    else
    {
        UINavigationController*navi=[[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        _window.rootViewController=navi;
    }
    [self.window makeKeyAndVisible];



    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application];

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)didAutoLoginWithError:(EMError *)aError{
    NSLog(@"自动登录失败");
}

- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
    NSLog(@"用户重新连入");
}

- (void)didLoginFromOtherDevice{
    NSLog(@"用户在其他设备上登录了");
}

- (void)didRemovedFromServer{
    NSLog(@"用户民从服务器上删除");
}

@end
