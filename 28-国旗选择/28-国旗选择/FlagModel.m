//
//  FlagModel.m
//  28-国旗选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "FlagModel.h"

@implementation FlagModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)FlagWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
