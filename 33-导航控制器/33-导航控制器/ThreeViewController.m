//
//  ThreeViewController.m
//  33-导航控制器
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ThreeViewController.h"
#import "TwoViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    UINavigationController *nav=self.navigationController;
    //移除栈顶控制器
    [nav popViewControllerAnimated:YES];
}
- (IBAction)jump2Two:(id)sender {
    UINavigationController *nav=self.navigationController;
    //跳到指定控制器
    [nav popToViewController:nav.viewControllers[1] animated:YES];
}
- (IBAction)back2bottom:(id)sender {
     UINavigationController *nav=self.navigationController;
    //跳到栈底控制器
    [nav popToRootViewControllerAnimated:YES];
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
