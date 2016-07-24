//
//  OneViewController.m
//  33-导航控制器
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
@interface OneViewController ()


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题及自定义样式方法1：
    self.navigationItem.title=@"第一个控制器";//如果标题不是很长，进到下一个控制器时返回的按钮默认是这个，如果特别长，是Back
    NSDictionary *attr=@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:attr];

    //设置返回按钮
    //创建自定义返回按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem=item;
    
    //设置导航栏左右两边按钮
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"你好" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    self.navigationItem.leftBarButtonItem=item2;
    self.navigationItem.leftBarButtonItems=@[item1,item2];
    self.navigationItem.rightBarButtonItems=@[item1,item2];
    
    //自定义标题方法2：
    //title也可以放自定义的view
    //self.navigationItem.titleView=[[UISwitch alloc]init];
    UILabel *titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0,100,44)];
    titlelabel.font=[UIFont boldSystemFontOfSize:15];
    titlelabel.textColor=[UIColor orangeColor];
    titlelabel.textAlignment=NSTextAlignmentCenter;
    titlelabel.text=@" 自定义标题";
    self.navigationItem.titleView=titlelabel;
    
    //设置标题另一种方式
    self.title=@"德玛西亚";
    
    //设置主题色，左右按钮的文字颜色
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    //设置bar的背景颜色，高斯模糊（毛玻璃）
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    //设置navigationBar前景色
    //[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    //设置ios7不渲染，即去掉navigationBar上半透明效果
    //self.navigationController.navigationBar.translucent=NO;
    
    UIImage *image=[UIImage imageNamed:@"shortcut_addFri@3x"];
    //设置不渲染，保持图片原本的颜色，如果不写这句话，图片会被渲染成系统默认的蓝色
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem=item3;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jump2Two:(id)sender {
    //获取nav
    UINavigationController *nav=self.navigationController;
    //创建第二个控制器
    TwoViewController *vc=[[TwoViewController alloc]init];
    //跳转（压栈）
    [nav pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
