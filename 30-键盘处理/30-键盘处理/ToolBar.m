//
//  ToolBar.m
//  30-键盘处理
//
//  Created by shadandan on 16/7/23.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ToolBar.h"

@implementation ToolBar
+(instancetype)toolBar{
    return [[NSBundle mainBundle]loadNibNamed:@"ToolBar" owner:nil options:nil][0];
}
- (IBAction)preClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(toolBar:withButtonType:)]) {
        [self.delegate toolBar:self withButtonType:ToolBarButtonTypePre];
    }
    //block实现
//    if (self.clickBlock) {
//        self.clickBlock(ToolBarButtonTypePre);
//    }
}
- (IBAction)nextClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(toolBar:withButtonType:)]) {
        [self.delegate toolBar:self withButtonType:ToolBarButtonTypeNext];
    }
}
- (IBAction)doneClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(toolBar:withButtonType:)]) {
        [self.delegate toolBar:self withButtonType:ToolBarButtonTypeDone];
    }
}
@end
