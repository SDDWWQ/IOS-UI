//
//  ContactModel.h
//  36-通讯录
//
//  Created by shadandan on 16/7/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *phoneNumber;
@end
