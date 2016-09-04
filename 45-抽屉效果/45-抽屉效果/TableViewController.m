//
//  TableViewController.m
//  45-抽屉效果
//
//  Created by shadandan on 16/8/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"72w58PICshJ_1024"].CGImage);
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 200)];
    self.tableView.tableHeaderView=headerView;
}


@end
