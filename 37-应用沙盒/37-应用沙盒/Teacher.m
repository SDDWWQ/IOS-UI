//
//  Teacher.m
//  37-应用沙盒
//
//  Created by shadandan on 16/7/27.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

//重写NSCoding协议的方法，告诉需要归档哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name11"];//相当于把值存到NSCoder里，并且设置它的键名为name11，这个名字可以随便起，但解档时也要是这个名字
    [aCoder encodeInteger:_age forKey:@"age"];
}
//重写NSCoding协议的方法，告诉系统需要解档哪些属性
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        _name=[aDecoder decodeObjectForKey:@"name11"];
        _age=[aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}
@end
