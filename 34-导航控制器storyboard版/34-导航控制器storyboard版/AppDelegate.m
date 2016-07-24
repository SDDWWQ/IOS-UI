//
//  AppDelegate.m
//  34-导航控制器storyboard版
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建window
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //初始化导航控制器
    UINavigationController *nv=[[UINavigationController alloc]init];//可以直接以第一个子控制器初始化,将init替换为initWithRootController:
    
    //设置window的跟控制器为导航控制器
    self.window.rootViewController=nv;
    
    //创建子控制器
    UIViewController *v1=[[UIViewController alloc]init];
    v1.view.backgroundColor=[UIColor redColor];
    UIViewController *v2=[[UIViewController alloc]init];
    v2.view.backgroundColor=[UIColor yellowColor];
    
    //添加子控制器，注意动画要设为NO否则viewControllers里就只有一个控制器（系统小bug）
    [nv pushViewController:v1 animated:NO];
    [nv pushViewController:v2 animated:NO];
    
    //获取导航控制器中所有的子控制器
    NSArray *array=nv.viewControllers;//可以赋值,nv.viewControllers=@[v1,v2];可以代替pushViewController
    NSArray *array1=nv.childViewControllers;//只读的
    NSLog(@"%@",array);
    
    //显示
    [self.window makeKeyAndVisible];
    //打印导航条frame
    NSLog(@"%@",nv.navigationBar);// frame = (0 20; 414 44);
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
