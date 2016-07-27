//
//  LoginViewController.m
//  36-通讯录
//
//  Created by shadandan on 16/7/24.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "LoginViewController.h"
#import "SVProgressHUD.h"
#import "ContactTableViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UISwitch *passwordSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *loginSwitch;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 实时监听文本框的内容
    [self.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}
-(void)textChange{
//    if (self.usernameField.text.length>0&&self.passwordField.text.length>0) {
//        self.loginButton.enabled=YES;
//    }else{
//        self.loginButton.enabled=NO;
//    }
    //改进
    self.loginButton.enabled=self.usernameField.text.length>0&&self.passwordField.text.length>0;
}
-(void)login{
    //提示框插件
    [SVProgressHUD setDefaultMaskType: SVProgressHUDMaskTypeBlack];//灰色背景效果
    [SVProgressHUD showWithStatus:@"正在加载"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //取消提示框
        [SVProgressHUD dismiss];
        if ([self.usernameField.text isEqualToString:@"1"]&&[self.passwordField.text isEqualToString:@"1"]) {
            
            //Segue必须由来源控制器来执行，也就是这个方法必须由来源控制器调用
            [self performSegueWithIdentifier:@"login2contact" sender:nil];
        }else{
            [SVProgressHUD showErrorWithStatus:@"用户名或密码错误！" ];
            [SVProgressHUD setDefaultMaskType: SVProgressHUDMaskTypeBlack];//灰色背景效果

         }

    });
}
//重写Segue的方法,只要走storyboard的线都会调用（无论手动型还是自动型）
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //从Segue里获取到目标控制器
    ContactTableViewController *vc=segue.destinationViewController;
    //顺传
    vc.username=self.usernameField.text;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//记住密码
- (IBAction)passwordSwitchChange:(UISwitch *)sender {
    if (!sender.isOn) {
        //直接修改状态是没有动画的，特别生硬，手动点击的时候是有动画的，可以通过调用set Animate方法来改进
        //self.loginSwitch.on=NO;
        [self.loginSwitch setOn:YES animated:YES];
    }
}
//自动登录
- (IBAction)loginSwitchChange:(UISwitch *)sender {
    if (sender.isOn) {
        //self.passwordSwitch.on=YES;
        [self.passwordSwitch setOn:YES animated:YES];
    }
}


@end
