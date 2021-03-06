//
//  AppDelegate.m
//  32-创建控制器的多种方式
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AppDelegate.h"
#import "SDDViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建window（window是一个特殊的UIView）
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建控制器
    //方法1.alloc init（代码创建）
    //SDDViewController *vc=[[SDDViewController alloc]init];
    
    /*
    //方法2：用storyboard创建（storyboard是一个特殊的xib）
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"SDD" bundle:nil];//bundle传nil相当于传的是[NSBundle mainBundle]
    //获取箭头所指向的控制器
    //SDDViewController *vc=[storyboard instantiateInitialViewController];
    //通过id在storyboard选中这个控制器
    SDDViewController *vc=[storyboard instantiateViewControllerWithIdentifier:@"sdd"];
    */
    
    //方式3：通过xib
    SDDViewController *vc=[[SDDViewController alloc]initWithNibName:@"SDDXib" bundle:nil];
    // 设置rootViewController
    self.window.rootViewController=vc;
    //显示出来
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
