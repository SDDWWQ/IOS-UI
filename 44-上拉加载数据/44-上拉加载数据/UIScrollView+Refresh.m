//
//  UIScrollView+Refresh.m
//  44-上拉加载数据
//
//  Created by shadandan on 16/8/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <objc/runtime.h>
//@interface UIScrollView()
//{
//    //分类中不能有_成员变量，用来存储数据，但可以通过runtime实现这个效果
//    PullUpRefreshView *_refreshView;
//}
//@end
static const char *key="refreshkey";//因为是C语言的定义方式所以不用加@符号
@implementation UIScrollView (Refresh)
-(void)setRefreshView:(PullUpRefreshView *)refreshView{
    objc_setAssociatedObject(self, key, refreshView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(PullUpRefreshView *)refreshView{
    //懒加载
    PullUpRefreshView *view=objc_getAssociatedObject(self, key);//相当于以前的PullUpRefreshView *view=_refreshView
    if(view==nil){//不存在时创建PullUpRefreshView
        view=[[PullUpRefreshView alloc]init];
        [self addSubview:view];
        self.refreshView=view;//保存对象
        
    }
    return view;
}
@end
