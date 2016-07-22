//
//  FlagView.m
//  28-国旗选择
//
//  Created by shadandan on 16/7/22.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "FlagView.h"
#import "FlagModel.h"
@interface FlagView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end
@implementation FlagView

+(instancetype)flag{
    return [[NSBundle mainBundle]loadNibNamed:@"FlagView" owner:nil options:nil][0];
}
-(void)setFlag:(FlagModel *)flag{
    _flag=flag;
    self.nameLabel.text=flag.name;
    self.iconView.image=[UIImage imageNamed:flag.icon];
}
@end
