//
//  AnimationDissmissedProxy.m
//  46.自定义转场（手指滑动）
//
//  Created by shadandan on 16/10/9.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "AnimationDissmissedProxy.h"

@implementation AnimationDissmissedProxy
#pragma mark-UIViewControllerAnimatedTransitioning的代理方法
//返回这个转场动画的执行时间
// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
//编写具体的转场动画的代码,只要自己实现了animatedTransition就必须自己定义转场动画
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1.获取这个转场动画的fromView
    UIView *fromView=[transitionContext viewForKey:UITransitionContextFromViewKey];
    //判断view的旋转方向
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if(fromView.transform.b>0){
            fromView.transform=CGAffineTransformMakeRotation(M_PI_2);
        }else{
            
        }fromView.transform=CGAffineTransformMakeRotation(-M_PI_2);
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
