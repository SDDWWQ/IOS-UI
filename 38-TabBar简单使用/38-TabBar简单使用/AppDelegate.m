//
//  AppDelegate.m
//  38-TabBar简单使用
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建window
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //2.创建tabbarcontroller
    UITabBarController *tab=[[UITabBarController alloc]init];
    //3.设置window的根控制器为tabbarcontroller
    self.window.rootViewController=tab;
    //4.创建子控制器
    UIViewController *v1=[[UIViewController alloc]init];
    v1.view.backgroundColor=[UIColor blueColor];
    //标题
    v1.tabBarItem.title=@"消息";
    //图片
    v1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    //提醒数字
    v1.tabBarItem.badgeValue=@"12";
    UIViewController *v2=[[UIViewController alloc]init];
    v2.view.backgroundColor=[UIColor redColor];
    v2.tabBarItem.title=@"联系人";
    v2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
     UIViewController *v3=[[UIViewController alloc]init];
    v3.view.backgroundColor=[UIColor purpleColor];
    v3.tabBarItem.title=@"动态";
    v3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    //5.添加子控制器
//    [tab addChildViewController:v1];
//    [tab addChildViewController:v2];
//    [tab addChildViewController:v3];
    tab.viewControllers=@[v1,v2,v3];
    //6.让window显示出来
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
