//
//  TestViewController.m
//  41-Modal
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self dismissViewControllerAnimated:YES completion:nil];
    Test2ViewController *vc2=[[Test2ViewController alloc]init];
    vc2.view.backgroundColor=[UIColor greenColor];
    //设置跳转动画,要对目标控制器进行设置
    vc2.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    vc2.cdismissBlock=^(){
        //[self dismissViewControllerAnimated:YES completion:nil];//Test调用dismissViewControllerAnimated:方法Test2被关闭
        if (self.dismissBlock) {//即ViewController调用dismissViewControllerAnimated:方法，Test和Test2都会被关闭
            self.dismissBlock();
        }
    };
    [self presentViewController:vc2 animated:YES completion:nil];
}


@end
