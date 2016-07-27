//
//  EditViewController.m
//  36-通讯录
//
//  Created by shadandan on 16/7/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameField.text=self.contact.name;
    self.phoneNumberField.text=self.contact.phoneNumber;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editClick:(id)sender {
    if (self.saveBtn.hidden) {
        self.nameField.enabled=YES;
        self.phoneNumberField.enabled=YES;
        self.saveBtn.hidden=NO;
        self.editBtn.title=@"取消";
        //让电话文本框成为第一响应者
        [self.phoneNumberField becomeFirstResponder];
    }else{
        self.nameField.enabled=NO;
        self.phoneNumberField.enabled=NO;
        self.saveBtn.hidden=YES;
        self.editBtn.title=@"编辑";
    }

}
- (IBAction)saveBtnClick:(id)sender {
    self.contact.name=self.nameField.text;
    self.contact.phoneNumber=self.phoneNumberField.text;
    if ([self.delegate respondsToSelector:@selector(editViewController:andContact:)]) {
        [self.delegate editViewController:self andContact:self.contact ];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
