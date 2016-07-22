//
//  ViewController.m
//  27-点餐系统
//
//  Created by shadandan on 16/7/21.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property(nonatomic,strong)NSArray *foods;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置数据源和代理
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    NSLog(@"%@",self.foods);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-懒加载
-(NSArray *)foods{
    if (!_foods) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"foods" ofType:@"plist"];
        _foods=[NSArray arrayWithContentsOfFile:path];
    }
    return _foods;
}
#pragma mark-数据源方法
// pickerview有多少组
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foods.count;
}

// pickerview有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.foods[component]count];//因为是数组的元素是id类型所以.不出来
}
//设置pickerview显示的文字内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *groups=self.foods[component];
    return groups[row];
}
@end
