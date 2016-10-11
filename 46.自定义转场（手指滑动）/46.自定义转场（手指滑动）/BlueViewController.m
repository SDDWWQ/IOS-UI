//
//  BlueViewController.m
//  46.自定义转场（手指滑动）
//
//  Created by shadandan on 16/10/9.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController
//控制器的View是通过调用loadView方法创建的
-(void)loadView{
    //自己创建View
    self.view=[[UIView alloc]init];
    self.view.backgroundColor=[UIColor blueColor];
    self.view.layer.anchorPoint=CGPointMake(0.5, 2.0);
    self.view.frame=[UIScreen mainScreen].bounds;
    //为blueView添加拖拽手势
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizedPanGesture:)];
    //将手势添加到blueView上
    [self.view addGestureRecognizer:pan];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////监听手指触摸屏幕
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //让蓝色view旋转
//    self.view.transform=CGAffineTransformRotate(self.blueView.transform, M_PI_4*0.2);
//}
//检测到拖拽手势后执行
-(void)didRecognizedPanGesture:(UIPanGestureRecognizer *)recognizer{
    NSLog(@"a:%f,b:%f,c:%f,d:%f",recognizer.view.transform.a,recognizer.view.transform.b,recognizer.view.transform.c,recognizer.view.transform.d);//打印出a、b、c、d的值，观察便于设定临界值（0.16）
    if(recognizer.state==UIGestureRecognizerStateEnded||recognizer.state==UIGestureRecognizerStateCancelled){
        
        if(ABS(recognizer.view.transform.b)>0.16){
            //要让蓝色View掉下去
//            [UIView animateWithDuration:1.0 animations:^{
//                recognizer.view.transform=CGAffineTransformMakeRotation(M_PI_2);
//            }];
            //要让蓝色View dissmiss
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            //要让蓝色view恢复到原始位置
            recognizer.view.transform=CGAffineTransformIdentity;
        }
    }else{
        //1.获取拖拽手势手指的偏移的x值
        CGFloat offsetX=[recognizer translationInView:recognizer.view].x;
        //2.计算当前手指位置的x值占屏幕宽度的百分比
        CGFloat percent=offsetX/self.view.bounds.size.width;
        //3.计算这次要旋转的度数
        CGFloat radians=M_PI_4*percent;
        //4.让blueView旋转
        self.view.transform=CGAffineTransformMakeRotation(radians);
    }
    
}


@end
