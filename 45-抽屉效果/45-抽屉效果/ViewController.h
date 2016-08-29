//
//  ViewController.h
//  45-抽屉效果
//
//  Created by shadandan on 16/8/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

+(instancetype)viewController:(UIViewController *)tableViewController andTabBarcintroller:(UIViewController *)tabbarController withLeftWidth:(CGFloat)width;//用于初始化，将tableView和tabbar都加到此viewController上
//打开左边菜单控制器
-(void)openLeftMenu;
//获得抽屉控制器
+(instancetype)shareDrawer;
@end

