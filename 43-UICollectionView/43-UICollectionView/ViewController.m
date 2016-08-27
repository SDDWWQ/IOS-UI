//
//  ViewController.m
//  43-UICollectionView
//
//  Created by shadandan on 16/8/21.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"jjjj");
    CollectionViewController *cv=[[CollectionViewController alloc]initWithCollectionViewLayout:[[UICollectionViewLayout alloc]init]];
    //[cv.collectionView setFrame:CGRectMake(0, 0, 320, 480)];
   
    [self.navigationController pushViewController:cv animated:YES];
}
@end
