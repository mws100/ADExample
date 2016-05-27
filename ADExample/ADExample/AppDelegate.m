//
//  AppDelegate.m
//  ADExample
//
//  Created by 马文帅 on 16/5/27.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ADViewController.h"
#import "ADItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    if (launchOptions) {
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    } else {
        ADViewController *adVC = [[ADViewController alloc] init];
        self.window.rootViewController = adVC;
        
        __weak typeof(self) weakSelf = self;
        adVC.completion = ^(ADItem *item) {
            if (item) {
                [[NSUserDefaults standardUserDefaults] setObject:item.adURL forKey:@"key"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            [UIView transitionWithView:weakSelf.window duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                BOOL oldState = [UIView areAnimationsEnabled];
                [UIView setAnimationsEnabled:NO];
                [weakSelf.window setRootViewController:nav];
                [UIView setAnimationsEnabled:oldState];
            } completion:^(BOOL finished) {
            }];
        };
        [self.window makeKeyAndVisible];
    }
    
    [self.window makeKeyWindow];
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

@end
