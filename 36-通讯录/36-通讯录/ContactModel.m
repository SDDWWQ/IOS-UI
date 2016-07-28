//
//  ContactModel.m
//  36-通讯录
//
//  Created by shadandan on 16/7/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_phoneNumber forKey:@"phone"];
}
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        _name=[aDecoder decodeObjectForKey:@"name"];
        _phoneNumber=[aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
