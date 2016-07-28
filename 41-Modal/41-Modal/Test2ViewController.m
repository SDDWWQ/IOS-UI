//
//  Test2ViewController.m
//  41-Modal
//
//  Created by shadandan on 16/7/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()

@end

@implementation Test2ViewController

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
    //block方式实现dismiss
    
    if(self.cdismissBlock){
        self.cdismissBlock();
    }
}

@end
