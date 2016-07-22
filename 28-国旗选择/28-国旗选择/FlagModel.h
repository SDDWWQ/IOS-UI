//
//  FlagModel.h
//  28-国旗选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlagModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)FlagWithDict:(NSDictionary *)dict;
@end
