//
//  ViewController.m
//  28-国旗选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "FlagModel.h"
#import "FlagView.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray *flags;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPickerView *pickerView=[[UIPickerView alloc]init];
    pickerView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:pickerView];
    pickerView.delegate=self;
    pickerView.dataSource=self;
    //NSLog(@"%@",self.flags);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-懒加载
-(NSArray *)flags{
    if (!_flags) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"flags" ofType:@"plist"];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            FlagModel *flag=[FlagModel FlagWithDict:dict];
            [tempArray addObject:flag];
        }
        _flags=tempArray;

    }
    return _flags;
}
#pragma mark-PickerView数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

//视图作为pickerview的元素
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    FlagModel *flag=self.flags[row];
    FlagView *flagView=[FlagView flag];
    flagView.flag=flag;
    return flagView;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60;
}
@end
