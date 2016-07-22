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
@property (weak, nonatomic) IBOutlet UILabel *fruit;
@property (weak, nonatomic) IBOutlet UILabel *food;
@property (weak, nonatomic) IBOutlet UILabel *drink;
@end

@implementation ViewController
//随机按钮的点击事件
- (IBAction)randomBtnClick:(id)sender {
    for (int i=0; i<self.foods.count; i++) {
        //获取某一组当前在第几行
        NSInteger seletedIndex=[self.pickerView selectedRowInComponent:i];
        NSInteger random= [self randomValueWithOldValue:seletedIndex lessThan:[self.foods[i] count]];
        //PickerView滚动到随机数行
        [self.pickerView selectRow:random inComponent: i animated:YES];
        //赋值到label，因为
        [self pickerView:nil didSelectRow:random inComponent:i];
    }
   
}
/**
 *  生成一个和旧数不一样的新数
 *
 *  @param oldValue 旧数
 *  @param lessThan 规则
 *
 *  @return 新数
 */
-(NSInteger)randomValueWithOldValue:(NSInteger)oldValue lessThan:(NSInteger)lessThan{
    NSInteger random;
    do{
        //生成随机数
        random=arc4random()%lessThan;//生成随机数方法arc4random()%3等价于arc4random_uniform(3)
    }while (random==oldValue);//如果一样 循环
    return random;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置数据源和代理
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    //NSLog(@"%@",self.foods);
    //设置初始化时候Label的内容
//    self.fruit.text=self.foods[][0];
//    self.food.text=self.foods[1][0];
//    self.drink.text=self.foods[2][0];
//改进，循环调用didSelectRow方法（此方法会在PickerView滚动的时候自动调用）现在手动调用
    for(int i=0;i<self.foods.count;i++){
        [self pickerView:self.pickerView didSelectRow:0 inComponent:i];
    }
    
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
    return self.foods[component][row];
}
//监听pickerView的手动选择，代码滚动监听不到
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:
            self.fruit.text=self.foods[component][row];
            break;
        case 1:
            self.food.text=self.foods[component][row];
            break;
        case 2:
            self.drink.text=self.foods[component][row];
            break;
        
    }
}
@end
