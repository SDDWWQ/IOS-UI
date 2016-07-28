//
//  YellowViewController.m
//  39-TabBar-storyboard里面创建
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"YellowDidLoad");
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"YellowWillAppear");
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"YellowDidAppear");
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"YellowWillDisappear");
}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"YellowDidDisappear");
}


@end
