//
//  ViewController.m
//  45-抽屉效果
//
//  Created by shadandan on 16/8/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(instancetype)viewController:(UIViewController *)tableViewController andTabBarcintroller:(UIViewController *)tabbarController withLeftWidth:(CGFloat)width{//用于初始化，将tableView和tabbar都加到此viewController上
    ViewController *vc=[[ViewController alloc]init];
    [vc.view addSubview:tableViewController.view];
    [vc.view addSubview:tabbarController.view];
    //规定：如果两个控制器的view互为父子关系，则这两个控制器也必须为父子关系
    [vc addChildViewController:tableViewController];
    [vc addChildViewController:tabbarController];
    return vc;
    
}
//打开左边菜单控制器
-(void)openLeftMenu{
    
    
}
//获得抽屉控制器
+(instancetype)shareDrawer{
    
}
@end
