//
//  ViewController.m
//  41-Modal
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "Test2ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TestViewController *vc=[[TestViewController alloc]init];
    vc.view.backgroundColor=[UIColor redColor];
    //设置跳转动画,要对目标控制器进行设置
    vc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    //block实现dismiss，验证其实是调用者dismiss的，不是被调用者，被调用者调用dismiss实际上是系统做了封装，本质上还是调用者dismiss的
    //a->b a执行dismiss b关闭
    //a->b->c b执行dismiss c关闭
    //a->b->c a执行dismiss b、c关闭
    //原理是若c调用dismissViewControllerAnimated:他会先看自己有没有modal出来一个view，有就把那个View关闭，结束，没有就想b发消息，让b执行dismiss，结束，b接到dismiss消息后看有没有子View，有c就把c关闭，结束，若a执行dismissViewControllerAnimated:就会把后面所有的全都关闭
    vc.dismissBlock=^(){
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
