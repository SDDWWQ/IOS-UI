//
//  EditViewController.h
//  36-通讯录
//
//  Created by shadandan on 16/7/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EditViewController;
#import "ContactModel.h"
#import "ContactModel.h"
@protocol EditViewControllerDelegate<NSObject>
@optional
-(void)editViewController:(EditViewController *)editViewController andContact:(ContactModel *)contact;
@end
@interface EditViewController : UIViewController
@property(nonatomic,strong)ContactModel *contact;//用于顺传
@property(nonatomic,weak)id<EditViewControllerDelegate> delegate;//用于逆传
@end
