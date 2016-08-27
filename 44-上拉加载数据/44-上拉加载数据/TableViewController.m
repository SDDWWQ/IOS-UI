//
//  TableViewController.m
//  44-上拉加载数据
//
//  Created by shadandan on 16/8/26.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "TableViewController.h"
//#import "PullUpRefreshView.h"
#import "UIScrollView+Refresh.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //注册单元格
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //设置一个没有大小的footerView
    UIView *footerView=[[UIView alloc]init];
    self.tableView.tableFooterView=footerView;
    
    //创建刷新控件
//    PullUpRefreshView *refreshView=[[PullUpRefreshView alloc]init];
//    [self.tableView addSubview:refreshView];
    
    __weak typeof(self) weakSelf=self;
    //用分类实现,调用设置block属性实现回调
    [self.tableView.refreshView setBlock:^{
        //加载plist数据
        
        [weakSelf.tableView reloadData];//加载完数据后刷新tableView，会有循环引用的警告，因此要把self包装成weak
        [weakSelf.tableView.refreshView endRefresh];//停止刷新，回到normal状态
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // 
        return cell;
}


@end
