//
//  UIScrollView+Refresh.h
//  44-上拉加载数据
//
//  Created by shadandan on 16/8/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullUpRefreshView.h"
@interface UIScrollView (Refresh)
@property(nonatomic,strong)PullUpRefreshView *refreshView;
@end
