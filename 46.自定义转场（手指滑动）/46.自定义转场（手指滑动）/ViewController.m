//
//  ViewController.m
//  46.自定义转场（手指滑动）
//
//  Created by shadandan on 16/9/28.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "BlueViewController.h"
#import "AnimationPresentedProxy.h"
#import "AnimationDissmissedProxy.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>
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
    //[self.view addSubview:blueView];
    self.blueView=blueView;
    
    //为blueView添加拖拽手势
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizedPanGesture:)];
    //将手势添加到blueView上
    [blueView addGestureRecognizer:pan];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBtn {
    
    BlueViewController *blueVc=[[BlueViewController alloc]init];
    //使用系统转场动画
    //blueVc.modalTransitionStyle=UIMenuControllerArrowLeft;//上一个view会消失
    //自定义转场动画
    blueVc.modalPresentationStyle=UIModalPresentationCustom;//设置自定义转场，上一个view不会消失
    //通过代理设置如何进行自定义转场
    blueVc.transitioningDelegate=self;
    [self presentViewController:blueVc animated:YES completion:nil];
    

}
#pragma mark-UIViewControllerTransitioningDelegate代理方法
//返回值表示当view呈现时通过哪个对象来执行动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    AnimationPresentedProxy *presentedProxy=[[AnimationPresentedProxy alloc]init];
    return presentedProxy;
}
//返回值是当view退出时通过哪个对象来执行动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    AnimationDissmissedProxy *dissmissedProxy=[[AnimationDissmissedProxy alloc]init];
    return dissmissedProxy;
}
@end
