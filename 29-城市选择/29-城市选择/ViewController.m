//
//  ViewController.m
//  29-城市选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceModel.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray *provinces;
@property(nonatomic,assign)NSInteger lastselectIndex;//记录上一次选择的省份
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    UIPickerView *pickerView=[[UIPickerView alloc]init];
    pickerView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:pickerView];
    pickerView.delegate=self;
    pickerView.dataSource=self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-懒加载
-(NSArray *)provinces{
    if (!_provinces) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"provinces" ofType:@"plist"];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            ProvinceModel *province=[ProvinceModel ProvinceWithDict:dict];
            [tempArray addObject:province];
        }
        _provinces=tempArray;
        
    }
    return _provinces;

}
#pragma mark-PickerView数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return self.provinces.count;
    }else{
        //获取省份的位置
        NSInteger provinceIndex=[pickerView selectedRowInComponent:0];
        //根据省份的位置获取行数
        return [[self.provinces[provinceIndex]cities] count];//不能用.获取cities，但可以用方法
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        return [self.provinces[row] name];
    }else{
        //NSInteger provinceIndex=[pickerView selectedRowInComponent:0];//这样只要一滚动就会刷新第二组数，当两组同时滚动时会造成数组越界问题，解决方法是滚动时不刷新，滚动停止时再刷新
        NSInteger provinceIndex=self.lastselectIndex;
        return [self.provinces[provinceIndex]cities][row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {//如果当前滚动的是第一组的行，就刷新第二组的数据
        self.lastselectIndex=row;
        [pickerView reloadComponent:1];
    }
}
@end
