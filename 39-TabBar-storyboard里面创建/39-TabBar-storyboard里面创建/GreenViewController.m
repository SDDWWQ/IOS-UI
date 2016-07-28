//
//  GreenViewController.m
//  39-TabBar-storyboard里面创建
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"GreenDidLoad");
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"GreenWillAppear");
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"GreenDidAppear");
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"GreenWillDisappear");
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"GreenDidDisappear");
}
@end
