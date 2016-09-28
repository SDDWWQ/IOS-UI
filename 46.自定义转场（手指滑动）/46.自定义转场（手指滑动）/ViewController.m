//
//  ViewController.m
//  46.自定义转场（手指滑动）
//
//  Created by shadandan on 16/9/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak)UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个蓝色view
    UIView *blueView=[[UIView alloc]init];
    blueView.backgroundColor=[UIColor blueColor];
    
    //修改blueView的anchorPoint属性
    blueView.layer.anchorPoint=CGPointMake(0.5, 2);//一定要在设置frame之前设置锚点，否则会默认认为锚点是中心点，从更改frame的大小,参数值大于1，则anchorpoint在控件外部
    
    blueView.frame=self.view.bounds;
    [self.view addSubview:blueView];
    self.blueView=blueView;
    
    //为blueView添加拖拽手势
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizedPanGesture:)];
    //将手势添加到blueView上
    [blueView addGestureRecognizer:pan];
}
////监听手指触摸屏幕
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //让蓝色view旋转
//    self.blueView.transform=CGAffineTransformRotate(self.blueView.transform, M_PI_4*0.2);
//}
//检测到拖拽手势后执行
-(void)didRecognizedPanGesture:(UIPanGestureRecognizer *)recognizer{
    //1.获取拖拽手势手指的偏移的x值
    CGFloat offsetX=[recognizer translationInView:recognizer.view].x;
    //2.计算当前手指位置的x值占屏幕宽度的百分比
    CGFloat percent=offsetX/self.view.bounds.size.width;
    //3.计算这次要旋转的度数
    CGFloat radians=M_PI_4*percent;
    //4.让blueView旋转
    self.blueView.transform=CGAffineTransformMakeRotation(radians);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
