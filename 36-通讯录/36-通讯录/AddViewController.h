//
//  AddViewController.h
//  36-通讯录
//
//  Created by shadandan on 16/7/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"
@class AddViewController;
@protocol AddViewControllerDelegate<NSObject>

@optional
-(void)addViewController:(AddViewController *)addViewController withContact:(ContactModel *)contact;
@end
@interface AddViewController : UIViewController
@property(nonatomic,weak)id<AddViewControllerDelegate> delegate;
@end
