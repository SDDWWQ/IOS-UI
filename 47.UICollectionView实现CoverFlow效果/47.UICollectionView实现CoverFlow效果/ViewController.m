//
//  ViewController.m
//  47.UICollectionView实现CoverFlow效果
//
//  Created by shadandan on 16/10/11.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#define ImageCount 10
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return ImageCount;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建一个cell
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"image_cell" forIndexPath:indexPath];
    return cell;
}

@end
