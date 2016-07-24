//
//  main.m
//  31-UIApplication
//
//  Created by shadandan on 16/7/23.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //argc是传入参数的个数
        //argv是具体的参数值
        //nil默认就是@"Application"
        //第四个参数相当于@"AppDeleagte"
        //这个函数实现的就是创建将@"Application"和@"AppDeleagte"并将他俩进行一个绑定，设置后者是前者的代理
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
