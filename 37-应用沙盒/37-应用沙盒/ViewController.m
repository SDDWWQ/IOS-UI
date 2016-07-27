//
//  ViewController.m
//  37-应用沙盒
//
//  Created by shadandan on 16/7/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"
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
- (IBAction)saveClick:(id)sender {
    NSArray *array=@[@"sdd",@"wwq",@123,@{@"s":@"1",@"d":@"2"}];
    
    //获取document的路径
    NSString *documentPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //文件路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:@"xx.plist"];
    //plist文件只能存储NSArray和NSDictionary类型的数据，写入plist文件可以用writeToFile方法，重复写会覆盖原有内容
    [array writeToFile:filePath atomically:YES];
    
    //偏好设置preference
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setObject:@"123" forKey:@"sdd"];
    [ud setBool:YES forKey:@"wwq"];
    [ud synchronize];//立即写入
    
    //归档
    Teacher *teacher=[[Teacher alloc]init];
    teacher.name=@"sdd";
    teacher.age=24;
    NSString *tempPath=NSTemporaryDirectory();
    filePath=[tempPath stringByAppendingPathComponent:@"teacher.data"];//这个文件的后缀名可以随便起
    [NSKeyedArchiver archiveRootObject:teacher toFile:filePath];
}
- (IBAction)getClick:(id)sender {
    //获取document的路径
    NSString *documentPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //文件路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:@"xx.plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",array);
    
    //取偏好设置
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[ud objectForKey:@"sdd"]);
    NSLog(@"%d",[ud boolForKey:@"wwq"]);
    
    //解档
    NSString *tempPath=NSTemporaryDirectory();
    filePath=[tempPath stringByAppendingPathComponent:@"teacher.data"];
    Teacher *teacher=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",teacher.name);
}

@end
