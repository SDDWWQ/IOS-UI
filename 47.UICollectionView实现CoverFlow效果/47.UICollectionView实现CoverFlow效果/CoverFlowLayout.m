//  自定义布局继承自UICollectionViewLayout
//  CoverFlowLayout.m
//  47.UICollectionView实现CoverFlow效果
//
//  Created by shadandan on 16/10/12.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;{// return an array layout attributes instances for all the views in the given rect
    
    //1.获取cell对应的attributes对象
    NSArray *arrayAttrs=[super layoutAttributesForElementsInRect:rect];
    //计算整体的中心点的值
    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.bounds.size.width*0.5;
    //2.修改一下attributes对象
    for(UICollectionViewLayoutAttributes *attr in arrayAttrs){
        //计算每个cell和中心点的距离
        CGFloat distance=ABS(attr.center.x-centerX);
        //距离越大，缩放比越小，距离越小，缩放比越大
        CGFloat factor=0.003;
        CGFloat scale=1/(1+distance*factor);
        attr.transform=CGAffineTransformMakeScale(scale, scale);
        
    }
    return arrayAttrs;
}
//当bounds发生改变的时候需要重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

//参数1：当手指滑动完毕后，自然情况下根据“惯性”，会停留到的位置
//参数2：滑动的速度point/second 点/秒
//返回值：人为要让它停留到的位置
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{// return a point at which to rest after scrolling - for layouts that want snap-to-point scrolling behavior
    //计算中心点的值
    CGFloat centerX=proposedContentOffset.x+self.collectionView.bounds.size.width*0.5;//当很慢速地滑动的时候手指抬起来时proposedContentOffset.x和collectionView.contentOffset.x是相等的，当快速滑动松手时，它们的值是不同的，collectionView.contentOffset.x是手抬起来那一刻的值，proposedContentOffset.x是惯性滑动后的值
    //获取可视区域之内的cell的attribute对象
    //计算可视区域
    CGFloat visibleX=proposedContentOffset.x;
    CGFloat visibleY=proposedContentOffset.y;
    CGFloat visibleW=self.collectionView.bounds.size.width;
    CGFloat visibleH=self.collectionView.bounds.size.height;
    CGRect visibleRect=CGRectMake(visibleX, visibleY, visibleW, visibleH);
    //获取给定区域内的cell的Attribute对象
    NSArray *arrayAttrs=[self layoutAttributesForElementsInRect:visibleRect];
    //比较出最小的偏移
    int min_idx=0;
    UICollectionViewLayoutAttributes *min_attr=arrayAttrs[min_idx];
    //循环比较出最小的
    for(int i=1;i<arrayAttrs.count;i++){
        //计算两个距离
        //1.min_attr和中心点的距离
        CGFloat distance1=ABS(min_attr.center.x-centerX);
        
        //2.当前循环的attr对象和centerX的距离
        UICollectionViewLayoutAttributes *obj=arrayAttrs[i];
        CGFloat distance2=ABS(obj.center.x-centerX);
        if (distance2<distance1) {
            min_idx=i;
            min_attr=obj;
        }
    }
    //计算出最小的偏移值
    CGFloat offsetX=min_attr.center.x-centerX;
    //人为来控制滚动的偏移
    return CGPointMake(proposedContentOffset.x+offsetX, proposedContentOffset.y);
}
@end
