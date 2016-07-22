//
//  ProvinceModel.h
//  29-城市选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSArray *cities;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)ProvinceWithDict:(NSDictionary *)dict;

@end
