//
//  ContactTableViewController.m
//  36-通讯录
//
//  Created by shadandan on 16/7/25.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ContactTableViewController.h"
#import "AddViewController.h"
#import "ContactModel.h"
#import "EditViewController.h"
@interface ContactTableViewController ()<UIActionSheetDelegate,AddViewControllerDelegate,UITableViewDataSource,EditViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray *contacts;
@end

@implementation ContactTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条的标题
    self.title=[NSString stringWithFormat:@"%@的联系人",self.username];
    //为了去掉空的cell下边的横线，如果有footerView空的cell下边的横线就不显示，否则显示
    self.tableView.tableFooterView=[[UIView alloc]init];
    //设置分割线的边距
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];//上左下右的边距
   }
//设置分割线左对齐
-(void)viewDidLayoutSubviews{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
//注销按钮的响应事件
- (IBAction)logout:(id)sender {
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"确定要注销吗" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定"otherButtonTitles:nil, nil];
    
    
    [sheet showInView:self.view];
}
#pragma mark-UIActionSheet的代理方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        //navigation Controller 弹出一个view
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //AddViewController *vc=segue.destinationViewController;
    //vc.delegate=self;
    //当连接多个Controller时，跳转时都会走这个方法，当那个Controller没有代理属性时会报错，因此要加一个判断，判断目标控制器的具体类型
    UIViewController *vc=segue.destinationViewController;
    if ([vc isKindOfClass:[AddViewController class]]) {
        AddViewController *add=(AddViewController *)vc;//强制转换
        add.delegate=self;
    }else if([vc isKindOfClass:[EditViewController class]]){
        EditViewController *edit=(EditViewController *)vc;
        NSIndexPath *indexPath= [self.tableView indexPathForSelectedRow];
        edit.contact=self.contacts[indexPath.row];
        edit.delegate=self;
    }
    
}
#pragma mark-懒加载
-(NSMutableArray *)contacts{
    if (!_contacts) {
        //必须得初始化
        _contacts=[NSMutableArray array];
    }
    return _contacts;
}
-(void)addViewController:(AddViewController *)addViewController withContact:(ContactModel *)contact{
    NSLog(@"%@%@",contact.name,contact.phoneNumber);
    [self.contacts addObject:contact];
    [self.tableView reloadData];

}

#pragma mark-数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contacts.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactModel *contact=self.contacts[indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Contact_Cell"];
    cell.textLabel.text=contact.name;
    cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
}
#pragma mark-EditViewController代理方法
-(void)editViewController:(EditViewController *)editViewController andContact:(ContactModel *)contact{
    //联系人列表向编辑界面传递的模型值实际上传递的是该模型的地址，所以在编辑页面对模型值进行修改时就是直接对源数据的修改，不需要再把修改后的模型值传递回联系人界面了，只需刷新联系人界面就可以了。或者根本不需要代理，返回联系人界面时，界面会重新显示，只需重写viewWillAppear方法，在方法中刷新tableView就可以了。
    [self.tableView reloadData];
}
//-(void)viewWillAppear:(BOOL)animated{
//    [self.tableView reloadData];
//}
@end
