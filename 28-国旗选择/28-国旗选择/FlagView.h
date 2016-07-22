//
//  FlagView.h
//  28-国旗选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlagModel;
@interface FlagView : UIView
@property(nonatomic,strong)FlagModel *flag;
+(instancetype)flag;
@end
