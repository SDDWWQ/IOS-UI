//
//  ViewController.m
//  31-UIApplication
//
//  Created by shadandan on 16/7/23.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取 UIApplication的单例
    UIApplication *app=[UIApplication sharedApplication];
    //判断用户手机的版本
    if([[UIDevice currentDevice].systemVersion floatValue]>=8.0){
        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [app registerUserNotificationSettings:setting];
    }
    app.applicationIconBadgeNumber=10;
   // @property(nonatomic) NSInteger applicationIconBadgeNumber __TVOS_PROHIBITED;  // set to 0 to hide. default is 0. In iOS 8.0 and later, your application must register for user notifications using -[UIApplication registerUserNotificationSettings:] before being able to set the icon badge.
    //设置网络指示器
    app.networkActivityIndicatorVisible=YES;
    
    //UIApplication对象设置状态栏的可见性
    //app.statusBarHidden=YES;
    //app.statusBarStyle=UIStatusBarStyleLightContent;//设置状态栏为白色
    
    NSURL *url=[NSURL URLWithString:@"mailto://1058088225@qq.com"];
    [app openURL:url];
    



}
//设置状态栏内容为白色
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
