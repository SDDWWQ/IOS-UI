//
//  AnimationPresentedProxy.m
//  46.自定义转场（手指滑动）
//
//  Created by shadandan on 16/10/9.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AnimationPresentedProxy.h"

@implementation AnimationPresentedProxy
#pragma mark-UIViewControllerAnimatedTransitioning的代理方法
//返回这个转场动画的执行时间
// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
//编写具体的转场动画的代码
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1.获取容器view
    UIView *containerView=[transitionContext containerView];
    //2.获取目标view
    UIView *toView=[transitionContext viewForKey:UITransitionContextToViewKey];
    //3.把目标view添加到容器view中
    [containerView addSubview:toView];
    //4.开始实现动画
    //4.1设置初始值
    toView.transform=CGAffineTransformMakeRotation(-M_PI_2);
    //4.2通过动画的方式旋转到默认位置
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform=CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        // 当转场动画结束后必须调用这个方法，否则新的视图无法识别手势事件
        [transitionContext completeTransition:YES];
    }
     ];
}

@end
