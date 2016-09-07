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
@property(nonatomic,strong)UIViewController *tableViewController;
@end

@implementation ViewController


+(instancetype)viewController:(UIViewController *)tableViewController andTabBarcintroller:(UIViewController *)tabbarController withLeftWidth:(CGFloat)width{//用于初始化，将tableView和tabbar都加到此viewController上
    
    //创建最底层的控制器
    ViewController *vc=[[ViewController alloc]init];
    vc.tabbarController=tabbarController;
    vc.leftWidth=width;
    vc.tableViewController=tableViewController;
    //把tabbarController和tableViewController都加到最底层控制器上
    [vc.view addSubview:tableViewController.view];
    [vc.view addSubview:tabbarController.view];
    //规定：如果两个控制器的view互为父子关系，则这两个控制器也必须为父子关系
    [vc addChildViewController:tableViewController];
    [vc addChildViewController:tabbarController];
    return vc;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    self.tableViewController.view.transform=CGAffineTransformMakeTranslation(-self.leftWidth, 0);//让tableView向左平移leftWidth的宽度，实现拉开时tableView也有动画效果
    //给TabBarController的view设置阴影效果
    self.tabbarController.view.layer.shadowColor=[UIColor blackColor].CGColor;
    self.tabbarController.view.layer.shadowOffset=CGSizeMake(-3, -3);
    self.tabbarController.view.layer.shadowOpacity=0.2;
    self.tabbarController.view.layer.shadowRadius=5;
    
    //给tabbarVC的子控制器的view添加边缘拖拽手势
    for(UIViewController *childVC in self.tabbarController.childViewControllers){
        [self addScreenEdgePanGestureRecognizerToView:childVC.view];
    }
    
}
/**
 *  给指定的view添加边缘拖拽手势
 *
 *  @param view 要添加边缘拖拽手势的view
 */
-(void)addScreenEdgePanGestureRecognizerToView:(UIView*)view{
    //创建边缘拖拽手势对象
    UIScreenEdgePanGestureRecognizer *pan=[[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGestureRecognizer:)];//回调
    pan.edges=UIRectEdgeLeft;//左边缘
    //添加手势
    [view addGestureRecognizer:pan];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  手势识别回调方法（检测到边缘拖拽后调用此函数）
 *
 *  @param pan 边缘手势对象
 */
-(void)edgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)pan{
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    //获得x方向拖拽的距离
    CGFloat offsetX=[pan translationInView:pan.view].x;
    self.tabbarController.view.transform=CGAffineTransformMakeTranslation(offsetX, 0);
    if(pan.state==UIGestureRecognizerStateEnded||pan.state==UIGestureRecognizerStateCancelled){//手势结束或被取消了
        //判断TabBarController的View有没有超过屏幕的一半
        if(self.tabbarController.view.frame.origin.x>screenW*0.5){
            [self openLeftMenu];
        }else {
            [self coverBtnClick];//恢复回去，抽屉覆盖状态
        }
        
    }else if(pan.state==UIGestureRecognizerStateChanged){//手一直在拖
        self.tabbarController.view.transform=CGAffineTransformMakeTranslation(offsetX, 0);
        self.tableViewController.view.transform=CGAffineTransformMakeTranslation(-self.leftWidth+offsetX, 0);
    }
}
//coverBtn懒加载
-(UIButton *)coverBtn{
    if (_coverBtn==nil) {
        _coverBtn=[[UIButton alloc]init];
       // _coverBtn.backgroundColor=[UIColor orangeColor];
        _coverBtn.frame=self.tabbarController.view.bounds;
        //监听按钮的点击
        [_coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //创建一个拖拽手势
        UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panCoverBtn:)];//拖拽遮盖按钮触发
    }
    return _coverBtn;
}
/**
 *  监听遮盖按钮的拖拽手势
 *
 *  @param pan <#pan description#>
 */
-(void)panCoverBtn:(UIPanGestureRecognizer *)pan{
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    //获得x方向的拖拽距离
    CGFloat offsetX=[pan translationInView:pan.view].x;
    NSLog(@"offsetX=%f",offsetX);//往右边拖偏移值大于0，往左边拖偏移值小于0
    
    //如果偏移值大于0，则是往右边拖拽遮盖按钮，直接返回，没有效果
    if(offsetX>0)return;
    CGFloat distance=self.leftWidth-ABS(offsetX);//300-100=200
    if(pan.state==UIGestureRecognizerStateEnded||pan.state==UIGestureRecognizerStateCancelled){
        
    }
    
}
//打开左边菜单控制器
-(void)openLeftMenu{
    [UIView animateWithDuration:0.25 animations:^{
        self.tabbarController.view.transform=CGAffineTransformMakeTranslation(self.leftWidth, 0);//将tabbar进行平移变换
        //self.tableViewController.view.transform=CGAffineTransformMakeTranslation(self.leftWidth, 0);//不能通过这种方式平移回去，这种方式会按照原来所在的位置平移，不会在之前平移到的位置的基础上进行平移
        self.tableViewController.view.transform=CGAffineTransformIdentity;//还原平移
    } completion:^(BOOL finished) {
        //tabbarController上添加覆盖按钮，为了实现随便低点击哪一处都会回到tabbarController
        [self.tabbarController.view addSubview:self.coverBtn];
    }];
    
}
-(void)coverBtnClick{
    [UIView animateWithDuration:0.25 animations:^{
        //CGAffineTransformIdentity：还原tabbarcontroller的view的transform
        self.tabbarController.view.transform=CGAffineTransformIdentity;
        
        //让tableView向左偏移
        self.tableViewController.view.transform=CGAffineTransformMakeTranslation(-self.leftWidth, 0);//让tableView向左平移leftWidth的宽度，实现拉开时tableView也有动画效果

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
