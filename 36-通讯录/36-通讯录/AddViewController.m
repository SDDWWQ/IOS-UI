//
//  AddViewController.m
//  36-通讯录
//
//  Created by shadandan on 16/7/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AddViewController.h"
#import "ContactModel.h"
@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation AddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self.nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
        [self.phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //让姓名文本框成为第一响应者
    [self.nameField becomeFirstResponder];
}
-(void)textChange{
    self.addBtn.enabled=self.nameField.text.length>0&&self.phoneField.text.length>0;
}
- (IBAction)addBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addViewController:withContact:)]) {
        ContactModel *contact=[[ContactModel alloc]init];
        contact.name=self.nameField.text;
        contact.phoneNumber=self.phoneField.text;
        [self.delegate addViewController:self withContact:contact];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
