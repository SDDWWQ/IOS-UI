//
//  ViewController.m
//  30-键盘处理
//
//  Created by shadandan on 16/7/23.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "ToolBar.h"
@interface ViewController ()<UITextFieldDelegate,ToolBarDelegate>
@property (weak, nonatomic) IBOutlet UITextField *birth;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property(nonatomic,strong)NSArray *testFields;
@property(nonatomic,strong)ToolBar *toolBar;//在控制上一个、下一个按钮是否可用时使用
@property(nonatomic,assign)NSInteger textFieldIndex;//当前textField在textFields数组中的下标，用于按钮点击切换第一响应者

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将文本框放到数组中
    self.testFields=@[self.birth,self.city];
    //设置文本框的代理
    self.birth.delegate=self;
    self.city.delegate=self;
    UIDatePicker *datePicker=[[UIDatePicker alloc]init];
    //设置DatePicker中的文字为中文
    datePicker.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    //设置DatePicker显示的是时间还是日期
    datePicker.datePickerMode=UIDatePickerModeDate;
    //监听DatePicker使用addtarget方式，因为它没有代理,当值改变时调用
    [datePicker addTarget:self action:@selector(timeChange:) forControlEvents:UIControlEventValueChanged];
    self.birth.inputView=datePicker;
    //创建toolbar作为辅助视图
    ToolBar *toolBar=[ToolBar toolBar];
    self.toolBar=toolBar;
    //设置文本框的辅助视图
    self.birth.inputAccessoryView=toolBar;
    self.city.inputAccessoryView=toolBar;
    //设置代理
    toolBar.delegate=self;
    
    //block实现toolBar上的点击事件,代替代理
//    toolBar.clickBlock=^(ToolBarButtonType type){
//        switch (type) {
//            case ToolBarButtonTypePre:
//                NSLog(@"上一个1");
//                break;
//            case ToolBarButtonTypeNext:
//                NSLog(@"下一个1");
//                break;
//            case ToolBarButtonTypeDone:
//                NSLog(@"完成1");
//                break;
//            default:
//                break;
//        }
//
//    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-TextView的代理方法
//文本框开始编辑时调用,传入的参数是当前点击的按钮对象
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //获取当前编辑的文本框在数组中的下标
//    for (int i=0; i<self.testFields.count; i++) {
//        if ([textField isEqual:_testFields[i]]) {
//            <#statements#>
//        }
//    }
    self.textFieldIndex=[self.testFields indexOfObject:textField];
    if (self.textFieldIndex==0) {//或者写成if([self.textFieldIndex isEqual:[self.textFields firstObject]])
        //如果是第一个，“上一个”按钮不可点击
        self.toolBar.preButton.enabled=NO;
        self.toolBar.nextButton.enabled=YES;
    }else if(self.textFieldIndex==self.testFields.count-1){
        //如果是最后一个，“下一个”按钮不可点击
        self.toolBar.preButton.enabled=YES;
        self.toolBar.nextButton.enabled=NO;
    }
    else{
        //如果既不是第一个也不是最后一个，那么两个按钮都可以点击
        self.toolBar.preButton.enabled=YES;
        self.toolBar.nextButton.enabled=YES;
    }
}
/*
 - (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
 - (BOOL)textViewShouldEndEditing:(UITextView *)textView;
 
 - (void)textViewDidBeginEditing:(UITextView *)textView;
 - (void)textViewDidEndEditing:(UITextView *)textView;
 
 - (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
 - (void)textViewDidChange:(UITextView *)textView;
 
 - (void)textViewDidChangeSelection:(UITextView *)textView;
 */
#pragma mark-datePicker值改变时调用的方法
-(void)timeChange:(UIDatePicker *)sender{
    //获取DatePicker的时间
    NSDate *date=sender.date;
    //创建一个格式化时间对象
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    //设置显示时间格式
    formatter.dateFormat=@"yyyy-MM-dd";
    //格式化
    NSString *dateString=[formatter stringFromDate:date];
    //赋值
    self.birth.text=dateString;
}
#pragma mark-ToolBar的代理方法
-(void)toolBar:(ToolBar *)toolBar withButtonType:(ToolBarButtonType)type{
    switch (type) {
        case ToolBarButtonTypePre:
            //从数组中取出上一个文本框，将它设为第一响应者
            [self.testFields[self.textFieldIndex-1] becomeFirstResponder];
            NSLog(@"上一个");
            break;
        case ToolBarButtonTypeNext:
            //从数组中取出下一个文本框，将它设为第一响应者
            [self.testFields[self.textFieldIndex+1] becomeFirstResponder];
            NSLog(@"下一个");
            break;
        case ToolBarButtonTypeDone:
            //收起键盘
            [self.view endEditing:YES];
            NSLog(@"完成");
            break;
        default:
            break;
    }
}
@end
