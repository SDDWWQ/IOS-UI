//
//  ViewController.m
//  35-导航控制器的生命周期
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController
//view加载完成的时候调用
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"加载完成");
}
- (IBAction)jump2Test:(id)sender {
    TestViewController *vc=[[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

//view将要显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"将要显示");
}

//view已经显示的时候调用
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"已经显示");
}

//view将要消失的时候调用
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"将要消失");
}

//view已经消失的时候调用
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"已经消失");
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
