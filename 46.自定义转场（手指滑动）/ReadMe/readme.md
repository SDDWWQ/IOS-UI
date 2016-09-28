1.修改blueView的anchorPoint属性

```objective-c
blueView.layer.anchorPoint=CGPointMake(0.5, 1);//设置view的下边界的中心为anchorPoint，参数也可以大于1，那么anchorPoint就在控件的外部
```

2.让蓝色view旋转

```objective-c
self.blueView.transform=CGAffineTransformRotate(self.blueView.transform, M_PI_4*0.2);
```

3.为blueView添加拖拽手势

```objective-c
UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didRecognizedPanGesture:)];
//将手势添加到blueView上
[blueView addGestureRecognizer:pan];
```

3.1.获取拖拽手势手指的偏移的x值

    CGFloat offsetX=[recognizer translationInView:recognizer.view].x;

3.2.计算当前手指位置的x值占屏幕宽度的百分比

    CGFloat percent=offsetX/self.view.bounds.size.width;
3.3.计算这次要旋转的度数

    CGFloat radians=M_PI_4*percent;
3.4.让blueView旋转

    self.blueView.transform=CGAffineTransformMakeRotation(radians);

