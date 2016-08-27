//
//  PullUpRefreshView.m
//  44-上拉加载数据
//
//  Created by shadandan on 16/8/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "PullUpRefreshView.h"
typedef enum{
    StatusNormal,//
    StatusPulling,//
    StatusRefreshing//
}RefreshStatus;
@interface PullUpRefreshView()
@property(nonatomic,weak)UIScrollView *scrollView;
@property(nonatomic,weak)UIImageView *animView;
@property(nonatomic,assign)RefreshStatus currentStatus ;
@end
@implementation PullUpRefreshView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame//在自己内部定义View大小，当外部用init创建时也会调用这个方法
{
    CGRect newFrame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    self = [super initWithFrame:newFrame];
    if (self) {
        self.backgroundColor=[UIColor brownColor];
    }
    return self;
}


-(void)dealloc{//移除kvo的监听
    [self.scrollView removeObserver:self forKeyPath:@"contentSize"];
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
   
}

//监听self.tableView的contentSize的变化，低耦合不要写在controller里面
//tableView是当前view的父控件
//添加到父控件时调用
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSLog(@"添加到父控件上了");
    if ([newSuperview isKindOfClass:[UIScrollView class]]) {
        self.scrollView=(UIScrollView*)newSuperview;
        //监听tableView的contentSize
        //KVO监听对象属性值的改变
        //Observer：谁来监听
        [self.scrollView addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];//contentSize 是scrollview中的一个属性，它代表scrollview中的可显示区域
        [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:0 context:NULL];//contentOffset 是scrollview当前显示区域顶点相对于frame顶点的偏移量
        
    }
}
//KVO调用方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentSize"]){
        NSLog(@"contentSize=%f",self.scrollView.contentSize.height);
        //设置新空间的frame.origin.y
        CGRect frame=self.frame;
        frame.origin.y=self.scrollView.contentSize.height;//改变frame
        self.frame=frame;//更新frame
    }else if([keyPath isEqualToString:@"contentOffset"]){
        //切换状态
        
        
        if(self.scrollView.isDragging){
            //手拖动
            NSLog(@"contentOffset=%f",self.scrollView.contentOffset.y);
            if(self.scrollView.contentOffset.y+self.scrollView.frame.size.height<self.scrollView.contentSize.height+60&&self.currentStatus==StatusPulling){
               //pulling-narmal
                self.currentStatus=StatusNormal;
            }
            
            if(self.scrollView.contentOffset.y+self.scrollView.frame.size.height>self.scrollView.contentSize.height+60&&self.currentStatus==StatusNormal){
                //normal-pulling
                self.currentStatus=StatusPulling;
            }
            
        }
        
        //手松开
        else{
           //pulling-refreshing
            if(self.currentStatus==StatusPulling){
                self.currentStatus=StatusRefreshing;
            }
        }
    }
}
-(void)setCurrentStatus:(RefreshStatus)currentStatus{
    _currentStatus=currentStatus;
    switch (currentStatus) {
        case StatusNormal:
           // 改变View的文字和图片的状态
            break;
        case StatusPulling:
            break;
        case StatusRefreshing:
        {
            //tableView底部加些间距
            UIEdgeInsets contentInset=self.scrollView.contentInset;
            contentInset.bottom=contentInset.bottom+60;
            if (self.block) {//判断block是否有值
                [self block];
            }
            break;
        }
        default:
            break;
    }
}

//停止刷新
-(void)endRefresh{
    if(self.currentStatus==StatusRefreshing){
        //停止动画
        [self.animView stopAnimating];
        //把底部距离移回去
        UIEdgeInsets contentInset=self.scrollView.contentInset;
        contentInset.bottom=contentInset.bottom-60;
        
    self.currentStatus=StatusNormal;
    }
}
@end
