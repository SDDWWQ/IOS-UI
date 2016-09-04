//
//  ViewController.m
//  45-抽屉效果
//
//  Created by shadandan on 16/8/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign)CGFloat leftWidth;

@property(nonatomic,strong)UIViewController *tabbarController;

@property(nonatomic,strong)UIButton *coverBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(instancetype)viewController:(UIViewController *)tableViewController andTabBarcintroller:(UIViewController *)tabbarController withLeftWidth:(CGFloat)width{//用于初始化，将tableView和tabbar都加到此viewController上
    
       ViewController *vc=[[ViewController alloc]init];
    vc.tabbarController=tabbarController;
    vc.leftWidth=width;
    [vc.view addSubview:tableViewController.view];
    [vc.view addSubview:tabbarController.view];
    //规定：如果两个控制器的view互为父子关系，则这两个控制器也必须为父子关系
    [vc addChildViewController:tableViewController];
    [vc addChildViewController:tabbarController];
    return vc;
    
}
//coverBtn懒加载
-(UIButton *)coverBtn{
    if (_coverBtn==nil) {
        _coverBtn=[[UIButton alloc]init];
       // _coverBtn.backgroundColor=[UIColor orangeColor];
        _coverBtn.frame=self.tabbarController.view.bounds;
        [_coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverBtn;
}
//打开左边菜单控制器
-(void)openLeftMenu{
    [UIView animateWithDuration:0.25 animations:^{
        self.tabbarController.view.transform=CGAffineTransformMakeTranslation(self.leftWidth, 0);//将tabbar进行平移变换
;
    } completion:^(BOOL finished) {
        //tabbarController上添加覆盖按钮，为了实现随便低点击哪一处都会回到tabbarController
        [self.tabbarController.view addSubview:self.coverBtn];
    }];
    
}
-(void)coverBtnClick{
    [UIView animateWithDuration:0.25 animations:^{
        //CGAffineTransformIdentity：还原view的transform
        self.tabbarController.view.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //tabbarController上添加覆盖按钮，为了实现随便低点击哪一处都会回到tabbarController
        [self.coverBtn removeFromSuperview];
        self.coverBtn=nil;
    }];
}
//获得抽屉控制器
+(instancetype)shareDrawer{
    return (ViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}
@end
