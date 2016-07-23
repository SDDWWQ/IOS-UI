//
//  ToolBar.h
//  30-键盘处理
//
//  Created by shadandan on 16/7/23.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToolBar;
//表示点击的是哪个button Item
typedef enum : NSUInteger {
    ToolBarButtonTypePre,
    ToolBarButtonTypeNext,
    ToolBarButtonTypeDone,
} ToolBarButtonType;

@protocol ToolBarDelegate <NSObject>
//代理方法
-(void)toolBar:(ToolBar *)toolBar withButtonType:(ToolBarButtonType)type;
@end

@interface ToolBar : UIToolbar
@property(nonatomic,weak)id<ToolBarDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *preButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
+(instancetype)toolBar;
//可以使用block来代替代理
//@property(nonatomic,copy)void (^clickBlock)(ToolBarButtonType type);//这句就相当于代理属性+代理方法
@end
