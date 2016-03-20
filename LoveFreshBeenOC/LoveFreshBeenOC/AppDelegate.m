//
//  AppDelegate.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ADViewController.h"
#import "GuideViewController.h"
#import "YTNavigationController.h"


@interface AppDelegate ()

@property(nonatomic,strong)ADViewController *ad;
@property(nonatomic,strong)ViewController *vc;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    GuideViewController *guide = [[GuideViewController alloc]init];
    self.vc = [[ViewController alloc]init];
    
    //第一次启动
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunch"]) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"everLaunch"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"firstLaunch"];
        
    }else {
        //不是第一次启动
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"firstLaunch"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        //第一次的引导图
        self.window.rootViewController = guide;
    }else {
        //广告界面
        self.window.rootViewController = self.ad ;
        [self performSelector:@selector(loadMainPage) withObject:nil afterDelay:1.f];
    }

    return YES;
}

-(ADViewController *)ad {
    
    if(_ad == nil) {
        _ad = [[ADViewController alloc]init];
    }
    return _ad;
}


-(void)loadMainPage {
    
    self.window.rootViewController = self.vc;
    
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
