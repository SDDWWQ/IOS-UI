//
//  ProvinceModel.m
//  29-城市选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)ProvinceWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
